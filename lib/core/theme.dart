import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const Color kcPrimary =  Color(0xff2B2B2B);
const Color kcDarkPrimary =  Color.fromARGB(0, 151, 111, 2);
const Color kcAccent =  Color(0xffF1F1F1);
const Color kcDarkAccent =  Color(0xff454545);

// dark colors
const Color kcAppbar = Color(0xff191919);
const Color kcBackground = Color(0xffffffff);
const Color kcGrey = Color(0xffd8d8d8);
const Color kcLightBlack = Color(0xff454545);

const Color kcLightPrimary = Color(0xffDBEAF2);
const Color kcLightWhite = Color(0xFFFAFAFA);
const Color kcDarkBlue = Color(0xff006AA6);
const Color kcLightGrey = Color(0xffF4F4F5);
const Color kcScaffoldBackground = Color(0xfffafafa);
const Color kcSuccess = Color(0xff5BD083);
const Color kcDarkGray = Color(0xff575757);
const Color kcMidGray = Color(0xffD9D9D9);
const Color kcCVBackgroundGray = Color(0xFFD6D6D6);
const Color kcExtraLightGrey = Color(0xffF2F3F9);
const Color kcGrey500 = Colors.grey;

const Color kcWhite = Color(0xffffffff);
const Color kcBlack = Color(0xff000000);
const Color kcDivider = Color(0xff454545);
const Color kcRed = Colors.red;
const Color kcOrange = Colors.orange;
const Color kcYellow = Colors.amberAccent;
const Color kcIndigo = Colors.indigo;
const Color kcGreen = Colors.green;
const Color kcTeal = Colors.teal;
const Color kcBlue = Colors.blue;

// get theme
ThemeData theme(BuildContext context) => Theme.of(context);

bool get isDark =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
    Brightness.dark;

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: kcWhite,
        useMaterial3: true,
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(kcPrimary),
        ),
        primaryColor: kcPrimary,
        splashColor: kcLightPrimary,
        primarySwatch: _lightMaterialColor,
        dialogTheme: const DialogTheme(surfaceTintColor: kcWhite),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _lightMaterialColor,
          accentColor: kcPrimary,
          backgroundColor: kcWhite,
          brightness: Brightness.light,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(kcBlue.withOpacity(0.1)),
          ),
        ),
        highlightColor: Colors.transparent,
        brightness: Brightness.light,
        indicatorColor: kcBlue,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: kcPrimary,
        ),
        appBarTheme: const AppBarTheme(centerTitle: true),
      );

  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
        primaryColor: kcDarkPrimary,
        primarySwatch: _lightMaterialColor,
        dialogTheme: const DialogTheme(
          surfaceTintColor: kcBlack,
          backgroundColor: kcBlack,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _lightMaterialColor,
          accentColor: kcDarkPrimary,
          backgroundColor: kcWhite,
          brightness: Brightness.dark,
        ),
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(kcBlue.withOpacity(0.1)),
        )),
        highlightColor: Colors.transparent,
        brightness: Brightness.dark,
        indicatorColor: kcBlue,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: kcBlue,
        ),
      );

  // for primary material color
  static MaterialColor get _lightMaterialColor => MaterialColor(
        kcPrimary.value,
        const <int, Color>{
          50: kcPrimary,
          100: kcPrimary,
          200: kcPrimary,
          300: kcPrimary,
          400: kcPrimary,
          500: kcPrimary,
          600: kcPrimary,
          700: kcPrimary,
          800: kcPrimary,
          900: kcPrimary,
        },
      );
}
