part of 'hb.theme.dart';

class ThemesHolder {
  ThemesHolder._();

  static HbTheme findWhere({
    required String? themeKey,
  }) {
    return mainTheme;
  }

  static HbTheme get mainTheme => _mainTheme;

  static final HbTheme _mainTheme = HbTheme._(
    data: _themeDataBuilder(
      textColor: const Color(kTextPrimary),
      primaryColorBrightness: Brightness.light,
      appBarColor: const Color(kPrimaryWhite),
      appBarTextColor: const Color(kTextPrimary),
      appBarIconsColor: const Color(kIconPrimary),
      systemUiOverlayStyle: SystemUiOverlayStyle.dark,
      primaryColor: const Color(kUiWarning),
      primaryTextColor: const Color(kTextWhite),
      secondaryButtonBorderColor: const Color(kUiWarning),
      secondaryButtonTextColor: const Color(kTextWhite),
      iconPrimaryColor: const Color(kIconPrimary),
    ),
    key: 'main',
    name: 'Main',
  );

  // Builders

  static ThemeData _themeDataBuilder({
    required Color textColor,
    required Color appBarColor,
    required SystemUiOverlayStyle systemUiOverlayStyle,
    required Color appBarTextColor,
    required Color appBarIconsColor,
    required Color primaryColor,
    required Brightness primaryColorBrightness,
    required Color primaryTextColor,
    required Color secondaryButtonBorderColor,
    required Color secondaryButtonTextColor,
    required Color iconPrimaryColor,
  }) {
    return ThemeData(
      cardColor: Colors.white,
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all(const Size(32.0, 32.0)),
          padding: WidgetStateProperty.all(const EdgeInsets.all(2.0)),
          shape: WidgetStateProperty.all(const OvalBorder(eccentricity: 0.0)),
        ),
      ),
      useMaterial3: true,
    );
  }
}
