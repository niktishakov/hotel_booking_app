import 'package:ai_translator/src/builder.dart';

class MetaIntl {
  MetaIntl(this.key, this.value)
      : assert(key.endsWith(intlEntryEnding)),
        assert(value.isNotEmpty),
        getterName = key.replaceFirst(intlEntryEnding, ''),
        hasZero = value.containsKey('zero'),
        hasOne = value.containsKey('one'),
        hasTwo = value.containsKey('two'),
        hasFew = value.containsKey('few'),
        hasMany = value.containsKey('many'),
        hasOther = value.containsKey('other');

  final String key;
  final Map<String, dynamic> value;

  final bool hasZero;
  final bool hasOne;
  final bool hasTwo;
  final bool hasFew;
  final bool hasMany;
  final bool hasOther;

  final String getterName;

  bool get requiresIntlPlural {
    return value.keys.length != 1;
  }

  bool get requiresGender {
    for (final entries in value.entries) {
      final genderMap = entries.value as Map<String, dynamic>;
      if (genderMap.values.length > 1) {
        return true;
      }
    }

    return false;
  }

  String concatenateAllValues() {
    final buffer = StringBuffer();

    for (final dynamicGenderMap in value.values) {
      final genderMap = dynamicGenderMap as Map<String, dynamic>;
      for (final dynamicText in genderMap.values) {
        final text = dynamicText as String;
        buffer.write(' $text ');
      }
    }

    return buffer.toString();
  }

  String generateDartCode() {
    final genderValue = requiresGender ? '$genderParam.intlString' : 'other';

    if (requiresIntlPlural) {
      final pluralBuffer = StringBuffer();

      pluralBuffer.writeln('Intl.plural(');

      if (hasZero) {
        pluralBuffer.writeln(_intlPluralCode(genderValue, 'zero'));
      }

      if (hasOne) {
        pluralBuffer.writeln(_intlPluralCode(genderValue, 'one'));
      }

      if (hasTwo) {
        pluralBuffer.writeln(_intlPluralCode(genderValue, 'two'));
      }

      if (hasFew) {
        pluralBuffer.writeln(_intlPluralCode(genderValue, 'few'));
      }

      if (hasMany) {
        pluralBuffer.writeln(_intlPluralCode(genderValue, 'many'));
      }

      if (hasOther) {
        pluralBuffer.writeln(_intlPluralCode(genderValue, 'other'));
      }

      pluralBuffer.writeln(')');

      return pluralBuffer.toString();
    } else {
      final genderMapKey = value.keys.first;
      final genderMap = value.values.first as Map<String, dynamic>;
      return _intlGenderCode(genderValue, genderMapKey, genderMap);
    }
  }

  String _intlPluralCode(String genderValue, String genderMapKey) {
    final genderMap = value[genderMapKey] as Map<String, dynamic>;

    return '''
      $genderMapKey:
      ${_intlGenderCode(genderValue, genderMapKey, genderMap)}
      ,
    ''';
  }

  String _intlGenderCode(
      String genderValue, String genderMapKey, Map<String, dynamic> genderMap) {
    // It doesn't really need a gender section, skip it and return the only translation available
    if (genderMap.keys.length == 1 && genderMap.keys.first == 'other') {
      return "((_tr['$key'] as Map<String, dynamic>)['$genderMapKey'] as Map<String, dynamic>)['other'] as String";
    }

    final genderBuffer = StringBuffer();

    genderBuffer.writeln('Intl.gender( $genderValue,');

    if (genderMap.containsKey('female')) {
      genderBuffer.writeln(
          "female: ((_tr['$key'] as Map<String, dynamic>)['$genderMapKey'] as Map<String, dynamic>)['female'] as String,");
    }

    if (genderMap.containsKey('male')) {
      genderBuffer.writeln(
          "male: ((_tr['$key'] as Map<String, dynamic>)['$genderMapKey'] as Map<String, dynamic>)['male'] as String,");
    }

    if (genderMap.containsKey('other')) {
      genderBuffer.writeln(
          "other: ((_tr['$key'] as Map<String, dynamic>)['$genderMapKey'] as Map<String, dynamic>)['other'] as String,");
    }

    genderBuffer.writeln(')');

    return genderBuffer.toString();
  }
}
