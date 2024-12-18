library gh.theme;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'hb.colors.dart';
part 'text_styles.dart';
part 'themes_holder.dart';

class HbTheme {
  HbTheme._({
    required this.data,
    required this.key,
    required this.name,
  })  : title80Semi = _title80Semi,
        title68Semi = _title68Semi,
        title32Semi = _title32Semi,
        title20 = _title20,
        title20Semi = _title20Semi,
        title16 = _title16,
        title16Semi = _title16Semi,
        body20 = _body20,
        body18 = _body18,
        body18M = _body18M,
        body16 = _body16,
        body16M = _body16M,
        body14M = _body14M,
        body14 = _body14,
        body12 = _body12,
        body12M = _body12M,
        body12Semi = _body12Semi,
        body12Up = _body12Up,
        button16Semi = _button16Semi,
        button10M = _button10M,
        bgPrimary = const Color(0xFFF9F9F9),
        bgSecondary = const Color(0xFFF2F3F3),
        bgCard = const Color(0xFFFFFFFF),
        bgCardClick = const Color(0xFFF9F9F9),
        bgWhite = const Color(0xFFFFFFFF),
        bgAccent = const Color.fromARGB(255, 0, 37, 10),
        bgAccentClick = const Color.fromARGB(200, 0, 37, 10),
        bgAccentOpacity = const Color.fromRGBO(109, 0, 37, 10),
        bgDanger = const Color(0xFFFF6643),
        bgDangerOpacity = const Color.fromRGBO(255, 102, 67, 0.12),
        bgSuccess = const Color(0xFF8FC754),
        bgSuccessOpacity = const Color.fromRGBO(143, 199, 84, 0.12),
        bgWarning = const Color(0xFFFFB625),
        bgModal = const Color.fromRGBO(0, 0, 0, 0.80),
        bgPrimaryInverse = const Color(0xFF08091C),
        textPrimary = const Color(0xFF1E1E1E),
        textSecondary = const Color(0xFF878999),
        textTertiary = const Color(0xFFBBBCC6),
        textAccent = const Color(0xFF6D7BFA),
        textDanger = const Color(0xFFFF6643),
        textSuccess = const Color(0xFF8FC754),
        textPrimaryOnColor = const Color(0xFFFFFFFF),
        textPrimaryInverse = const Color(0xFFFFFFFF),
        textSecondaryInverse = const Color(0xFF9C9DA4),
        borderPrimary = const Color(0xFFE4E5E5),
        borderAccent = const Color(0xFF6D7BFA),
        borderWhite = const Color(0xFFFFFFFF),
        borderPrimaryInverse = const Color(0xFF08091C),
        borderDanger = const Color(0xffFF6643),
        iconPrimary = const Color(0xFF1E1E1E),
        iconSecondary = const Color(0xFF878999),
        iconTertiary = const Color(0xFFBBBCC6),
        iconAccent = const Color(0xFF6D7BFA),
        iconDanger = const Color(0xFFFF6643),
        iconSuccess = const Color(0xFF8FC754),
        iconPrimaryOnColor = const Color(0xFFFFFFFF),
        dividerPrimary = const Color(0xFFE4E5E5),
        shadowBlack = const Color.fromRGBO(0, 0, 0, 0.25),
        shadowGray = const Color(0x336A6D83),
        shadowAccent = const Color.fromRGBO(149, 163, 235, 0.70);

  final TextStyle title80Semi;
  final TextStyle title68Semi;
  final TextStyle title32Semi;
  final TextStyle title20;
  final TextStyle title20Semi;
  final TextStyle title16;
  final TextStyle title16Semi;
  final TextStyle body20;
  final TextStyle body18;
  final TextStyle body18M;
  final TextStyle body16;
  final TextStyle body16M;
  final TextStyle body14M;
  final TextStyle body14;
  final TextStyle body12;
  final TextStyle body12M;
  final TextStyle body12Semi;
  final TextStyle body12Up;
  final TextStyle button16Semi;
  final TextStyle button10M;

  final Color bgPrimary;
  final Color bgSecondary;
  final Color bgCard;
  final Color bgCardClick;
  final Color bgWhite;
  final Color bgAccent;
  final Color bgAccentClick;
  final Color bgAccentOpacity;
  final Color bgDanger;
  final Color bgDangerOpacity;
  final Color bgSuccess;
  final Color bgSuccessOpacity;
  final Color bgWarning;
  final Color bgModal;
  final Color bgPrimaryInverse;

  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textAccent;
  final Color textDanger;
  final Color textSuccess;
  final Color textPrimaryOnColor;
  final Color textPrimaryInverse;
  final Color textSecondaryInverse;

  final Color borderPrimary;
  final Color borderAccent;
  final Color borderWhite;
  final Color borderPrimaryInverse;
  final Color borderDanger;

  final Color iconPrimary;
  final Color iconSecondary;
  final Color iconTertiary;
  final Color iconAccent;
  final Color iconDanger;
  final Color iconSuccess;
  final Color iconPrimaryOnColor;

  final Color dividerPrimary;

  final Color shadowBlack;
  final Color shadowGray;
  final Color shadowAccent;

  final ThemeData data;
  final String key;
  final String name;
}
