import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'res.dart';

abstract class AppStyle {
  AppStyle();

  static String fontFamily = "SVN-Gilroy";

  static TextStyle DEFAULT_10 = TextStyle(
      fontSize: 10.sp,
      fontFamily: fontFamily,
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);

  static TextStyle DEFAULT_12 = TextStyle(
      fontSize: 12.sp,
      fontFamily: fontFamily,
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);

  static TextStyle DEFAULT_14 = TextStyle(
      fontSize: 14.sp,
      fontFamily: fontFamily,
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);

  static const TextStyle TEXT_16 = TextStyle(
      fontSize: 16,
      fontFamily: "SVN-Gilroy",
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);

  static TextStyle DEFAULT_16 = TextStyle(
      fontSize: 16.sp,
      fontFamily: fontFamily,
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);

  static TextStyle DEFAULT_18 = TextStyle(
      fontSize: 18.sp,
      fontFamily: fontFamily,
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);

  static TextStyle DEFAULT_20 = TextStyle(
      fontSize: 20.sp,
      fontFamily: fontFamily,
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);
  static TextStyle DEFAULT_22 = TextStyle(
      fontSize: 22.sp,
      fontFamily: fontFamily,
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);
  static TextStyle DEFAULT_24 = TextStyle(
      fontSize: 24.sp,
      fontFamily: fontFamily,
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);
  static TextStyle DEFAULT_28 = TextStyle(
      fontSize: 28.sp,
      fontFamily: fontFamily,
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);
  static TextStyle DEFAULT_32 = TextStyle(
      fontSize: 32.sp,
      fontFamily: fontFamily,
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);
  static TextStyle DEFAULT_36 = TextStyle(
      fontSize: 36.sp,
      fontFamily: fontFamily,
      color: AppColors.textBlack,
      height: 1.5,
      fontWeight: FontWeight.normal);

  // ignore: non_constant_identifier_names
  static final DEFAULT_10_BOLD =
  DEFAULT_10.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_12_BOLD =
  DEFAULT_12.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_14_BOLD =
  DEFAULT_14.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_16_BOLD =
  DEFAULT_16.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_18_BOLD =
  DEFAULT_18.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_20_BOLD =
  DEFAULT_20.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_22_BOLD =
  DEFAULT_20.copyWith(fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static final DEFAULT_24_BOLD =
  DEFAULT_24.copyWith(fontWeight: FontWeight.bold);

  Map<String, ThemeData> onConfigSupportedThemes();

  Map<String, ThemeData> getSupportedThemes() {
    var themes = supportedThemes;
    themes.addAll(onConfigSupportedThemes());
    return themes;
  }

  static Map<String, ThemeData> supportedThemes = {
    'Light': ThemeData.light(),
    'Dark': ThemeData.dark(),
    // 'Anton': DataUtils.getGoogleThemeData('Anton'),
    // 'Inter': DataUtils.getGoogleThemeData('Inter'),
    'custom1': ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],

      // Define the default font family.
      fontFamily: 'SVN-Gilroy',

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    ),
  };
  // ignore: non_constant_identifier_names

  static ThemeData getTheme({String? themeName}) {
    var defaultTheme = ThemeData.light();
    // var theme = themes as Map<String, ThemeData>;
    // print('ThemeData ${theme[themeName]}');
    return supportedThemes[themeName] ?? defaultTheme;
  }

  static BoxShadow shadow5 = BoxShadow(
    color: Colors.black.withOpacity(0.05),
    spreadRadius: 0,
    blurRadius: 20,
    offset: const Offset(0, 4),
  );
  static BoxShadow shadow10 = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 20,
    offset: const Offset(0, 4),
  );
}
