import 'dart:convert';

import 'package:ai_translator/src/keys_comparator.dart';
import 'package:ai_translator/src/translator.dart';
import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';

const baseClassName = '_BaseTr';

const nameTag = '<name>';
const name2Tag = '<name2>';
const dateTag = '<date>';
const timeTag = '<time>';
const textTag = '<text>';

const intlEntryEnding = '_intl';

const nameParam = 'name';
const name2Param = 'name2';
const dateParam = 'date';
const timeParam = 'time';
const textParam = 'text';
const genderParam = 'gender';

class AiTranslator implements Builder {
  @override
  Future build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;
    final jsonContent = await buildStep.readAsString(inputId);
    // Use the en_US as the default set of keys to generate the classes
    final json = jsonDecode(jsonContent) as Map<String, dynamic>;
    final enUSJson = json['en_US'] as Map<String, dynamic>;

    for (final entry in enUSJson.entries) {
      if (entry.value is String) {
        throw Exception(
            'The top level key should not contain any field with type String: found $entry');
      }
    }

    enUSJson.keysAreTheSameOrThrow(enUSJson,
        thisLabel: 'en_US', otherLabel: 'ru_RU');

    final output = StringBuffer();
    output.writeln(
      '''
      // ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
      // GENERATED FILE, do not edit!
      import 'package:intl/intl.dart';

      class $baseClassName {
        $baseClassName(this._tr) : assert(_tr.isNotEmpty);

        final Map<String, dynamic> _tr;

        String get(String label) => _tr[label] as String;
      }

      class Translations extends $baseClassName {
        Translations(this._locale, Map<String, dynamic> tr) : assert(_locale.isNotEmpty), super(tr);

        final String _locale;''',
    );
    for (final entry in enUSJson.entries) {
      if (entry.value is! String) {
        output.writeln('');
        final innerClassName = '${entry.key.capitalised}Tr';
        output.writeln(
            '  $innerClassName get ${entry.key} => $innerClassName(_tr[_locale][\'${entry.key}\'] as Map<String, dynamic>);');
      }
    }

    output.writeln('}');
    output.writeln('');
    for (final entry in enUSJson.entries) {
      if (entry.value is! String) {
        generateInnerTranslations(
          ukJson: entry.value as Map<String, dynamic>,
          usJson: enUSJson[entry.key] as Map<String, dynamic>,
          className: entry.key.capitalised,
          output: output,
        );
      }
    }

    final copy = inputId.changeExtension('.dart');

    final formatter = DartFormatter(pageWidth: 160);
    final dartFileContent = formatter.format(output.toString());

    await buildStep.writeAsString(copy, dartFileContent);
  }

  @override
  final buildExtensions = const {
    '.ai.tr.json': ['.ai.tr.dart']
  };
}
