import 'package:ai_translator/src/builder.dart';

class MetaString {
  MetaString({
    required this.text,
    required this.requiresIntlPlural,
    required this.requiresGender,
  })  : requiresName = text.contains(nameTag),
        requiresName2 = text.contains(name2Tag),
        requiresDate = text.contains(dateTag),
        requiresTime = text.contains(timeTag),
        requiresText = text.contains(textTag);

  final String text;

  final bool requiresIntlPlural;

  final bool requiresName;

  final bool requiresName2;

  final bool requiresDate;

  final bool requiresTime;

  final bool requiresText;

  final bool requiresGender;

  bool get requiresParameters =>
      requiresIntlPlural ||
      requiresName ||
      requiresName2 ||
      requiresDate ||
      requiresTime ||
      requiresText;

  String generateParametersList() {
    var parameters = '';

    /// Intl related parameters
    /// Note: count can also be used as  a normal parameter

    if (requiresGender) {
      parameters += 'required Gender $genderParam, ';
    }
    if (requiresName) {
      parameters += 'required String $nameParam, ';
    }
    if (requiresName2) {
      parameters += 'required String $name2Param, ';
    }
    if (requiresDate) {
      parameters += 'required String $dateParam, ';
    }
    if (requiresTime) {
      parameters += 'required String $timeParam, ';
    }
    if (requiresText) {
      parameters += 'required String $textParam, ';
    }

    parameters = parameters.trim();

    assert(parameters != '');
    parameters = parameters.substring(0, parameters.length - 1);

    return parameters;
  }

  String generateReplaceAll() {
    var generateAll = '';

    if (requiresName) {
      generateAll += '.replaceAll(\'$nameTag\', $nameParam)';
    }
    if (requiresName2) {
      generateAll += '.replaceAll(\'$name2Tag\', $name2Param)';
    }
    if (requiresText) {
      generateAll += '.replaceAll(\'$textTag\', $textParam)';
    }
    if (requiresDate) {
      generateAll += 'required String $dateParam, ';
    }
    if (requiresTime) {
      generateAll += 'required String $timeParam, ';
    }

    return generateAll.trim();
  }

  MetaString merge(MetaString other) {
    return MetaString(
      text: '$text ${other.text}',
      requiresIntlPlural: requiresIntlPlural,
      requiresGender: requiresGender,
    );
  }
}
