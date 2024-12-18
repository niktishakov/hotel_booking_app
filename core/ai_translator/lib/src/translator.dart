import 'package:ai_translator/src/builder.dart';
import 'package:ai_translator/src/meta_intl.dart';
import 'package:ai_translator/src/meta_string.dart';

extension StringEx on String {
  String get capitalised {
    if (isEmpty) {
      return '';
    }

    return replaceRange(0, 1, this[0].toUpperCase());
  }
}

extension TypeChecker on MapEntry<String, dynamic> {
  bool get isString => value is String;

  bool get isIntl => key.endsWith(intlEntryEnding);

  bool get isMap => !isString && !isIntl;
}

void generateInnerTranslations({
  required Map<String, dynamic> ukJson,
  required Map<String, dynamic> usJson,
  required String className,
  required StringBuffer output,
}) {
  output.writeln('class ${className}Tr extends $baseClassName {');
  output.writeln('  ${className}Tr(Map<String, dynamic> tr) : super(tr);');
  for (final entry in ukJson.entries) {
    if (entry.isString || entry.isIntl) {
      output.writeln('');
      generateStringGetter(
        ukEntry: entry,
        usEntry: MapEntry<String, dynamic>(entry.key, usJson[entry.key]),
        output: output,
      );
    }
  }
  for (final entry in ukJson.entries) {
    if (entry.isMap) {
      output.writeln('');
      final innerClassName = '$className${entry.key.capitalised}Tr';
      output.writeln(
          '  $innerClassName get ${entry.key} => $innerClassName(_tr[\'${entry.key}\'] as Map<String, dynamic>);');
    }
  }
  output.writeln('}');
  output.writeln('');
  for (final entry in ukJson.entries) {
    if (entry.isMap) {
      generateInnerTranslations(
        ukJson: entry.value as Map<String, dynamic>,
        usJson: usJson[entry.key] as Map<String, dynamic>,
        className: '$className${entry.key.capitalised}',
        output: output,
      );
    }
  }
}

void generateStringGetter({
  required MapEntry<String, dynamic> ukEntry,
  required MapEntry<String, dynamic> usEntry,
  required StringBuffer output,
}) {
  String valueToReturn;
  MetaIntl? ukMetaIntl;
  MetaIntl? usMetaIntl;

  if (ukEntry.isIntl) {
    ukMetaIntl = MetaIntl(ukEntry.key, ukEntry.value as Map<String, dynamic>);
    valueToReturn = ukMetaIntl.generateDartCode();

    // If UK isIntl then US is too
    usMetaIntl = MetaIntl(usEntry.key, usEntry.value as Map<String, dynamic>);
  } else {
    valueToReturn = 'get(\'${ukEntry.key}\')';
  }

  final ukMetaString = MetaString(
    text: ukEntry.isIntl
        ? ukMetaIntl!.concatenateAllValues()
        : ukEntry.value as String,
    requiresIntlPlural: ukMetaIntl?.requiresIntlPlural ?? false,
    requiresGender: ukMetaIntl?.requiresGender ?? false,
  );

  final usMetaString = MetaString(
    text: usEntry.isIntl
        ? usMetaIntl!.concatenateAllValues()
        : usEntry.value as String,
    requiresIntlPlural: usMetaIntl?.requiresIntlPlural ?? false,
    requiresGender: usMetaIntl?.requiresGender ?? false,
  );

  final metaString = ukMetaString.merge(usMetaString);

  if (metaString.requiresParameters) {
    output.writeln(
        '  String ${ukEntry.isIntl ? ukMetaIntl!.getterName : ukEntry.key}({${metaString.generateParametersList()}}) {');
    output.writeln(
        '    return $valueToReturn${metaString.generateReplaceAll()};');
    output.writeln('  }');
  } else {
    output.writeln(
        '  String get ${ukEntry.key} => get(\'${ukEntry.key}\')${metaString.generateReplaceAll()};');
  }
}
