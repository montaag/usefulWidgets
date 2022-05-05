import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:usefull_widgets/config/palette.dart';

mixin CustomTheme {
  //? THEME
  static const bool _isDarkEnabled = false;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Palette.backgroundColor,
    backgroundColor: Palette.backgroundColor,
    primaryColor: Palette.primaryColor,
    appBarTheme: AppBarTheme(
      color: Palette.backgroundColor,
      elevation: 3,
      shadowColor: Colors.grey[50]?.withAlpha(100),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Palette.primaryColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Palette.primaryColor,
      unselectedItemColor: Colors.grey[800],
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Palette.primaryColor.withOpacity(0.1)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      elevation: 3.0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
  );

  static ThemeData darkTheme = _isDarkEnabled ? ThemeData.dark() : lightTheme;

  //? Fonts

  static TextStyle baseStyle(
    TextStyle style, {
    FontStyle fontStyle = FontStyle.normal,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration decoration = TextDecoration.none,
    Color color = Palette.primaryTextColor,
  }) {
    return style.copyWith(
      fontFamily: "NunitoSans",
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: decoration,
      letterSpacing: .6,
    );
  }

  static TextStyle title(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    Color color = Palette.primaryTextColor,
  }) {
    return baseStyle(
      Theme.of(context).textTheme.headline6!,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle subtitle(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    Color color = Palette.primaryTextColor,
  }) {
    return baseStyle(
      Theme.of(context).textTheme.subtitle1!,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle body(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    Color color = Palette.primaryTextColor,
  }) {
    return baseStyle(
      Theme.of(context).textTheme.bodyText1!,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color,
      decoration: decoration,
    );
  }
}
