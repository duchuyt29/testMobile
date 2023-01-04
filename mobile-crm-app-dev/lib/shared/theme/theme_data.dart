import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class ThemeConfig {
  ThemeConfig();

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        primaryColor: AppColor.primaryColor,
        secondaryColor: AppColor.secondaryColor,
        primaryBackgroundColor: AppColor.primaryBackgroundColor,
        primaryTextColor: AppColor.primaryTextColor,
        hintText: AppColor.primaryHintColor,
        canvasColor: AppColor.canvasColor,
        divider: AppColor.dividerColor,
        disabled: AppColor.disabledColor,
        shadowColor: AppColor.shadowColor,
        primaryBorderColor: AppColor.primaryBorderColor,
        error: AppColor.errorColor,
      );

  static ThemeData createTheme({
    required Brightness brightness,
    required Color primaryColor,
    required Color secondaryColor,
    required Color canvasColor,
    required Color primaryTextColor,
    required Color primaryBackgroundColor,
    required Color error,
    required Color hintText,
    required Color primaryBorderColor,
    Color? divider,
    Color? disabled,
    Color? shadowColor,
  }) {
    final baseTextTheme = brightness == Brightness.light
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    return ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(
          size: 14,
          color: Colors.white, //change your color here
        ),
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      platform: TargetPlatform.iOS,
      brightness: brightness,
      fontFamily: GoogleFonts.sourceSansPro().fontFamily,
      primaryColor: primaryColor,
      canvasColor: canvasColor,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primaryColor,
        onPrimary: Colors.white,
        secondary: secondaryColor,
        onSecondary: secondaryColor.withOpacity(0.2),
        error: error,
        onError: error.withOpacity(0.2),
        background: primaryBackgroundColor,
        onBackground: primaryBackgroundColor.withOpacity(0.2),
        surface: primaryBackgroundColor,
        onSurface: primaryTextColor,
      ),
      backgroundColor: primaryBackgroundColor,
      scaffoldBackgroundColor: primaryBackgroundColor,
      dialogBackgroundColor: primaryBackgroundColor,
      cardColor: primaryBackgroundColor,
      splashColor: primaryBackgroundColor,
      disabledColor: disabled,
      dividerColor: divider,
      dialogTheme: DialogTheme(
        backgroundColor: primaryBackgroundColor,
      ),
      dividerTheme: DividerThemeData(
        color: divider,
        thickness: 1,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: primaryBackgroundColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textTheme: textTheme(baseTextTheme, primaryTextColor),
      inputDecorationTheme: inputDecorationTheme(primaryBackgroundColor,
          primaryColor, primaryBorderColor, error, hintText),
    );
  }

  static TextTheme textTheme(TextTheme baseTextTheme, Color primaryTextColor) {
    return TextTheme(
      // headline1: GoogleFonts.sourceSansPro(
      //   color: primaryTextColor,
      //   fontSize: 19,
      //   fontWeight: FontWeight.normal,
      // ),
      // headline2: GoogleFonts.sourceSansPro(
      //   color: primaryTextColor,
      //   fontSize: 20,
      //   fontWeight: FontWeight.w500,
      // ),
      // headline3: GoogleFonts.sourceSansPro(
      //   color: primaryTextColor,
      //   fontSize: 22,
      //   fontWeight: FontWeight.normal,
      // ),
      // headline4: GoogleFonts.sourceSansPro(
      //   color: primaryTextColor,
      //   fontSize: 24,
      //   fontWeight: FontWeight.normal,
      // ),
      // headline5: GoogleFonts.sourceSansPro(
      //   color: primaryTextColor,
      //   fontSize: 26,
      //   fontWeight: FontWeight.normal,
      // ),
      // headline6: GoogleFonts.sourceSansPro(
      //   color: primaryTextColor,
      //   fontSize: 28,
      //   fontWeight: FontWeight.normal,
      // ),
      // bodyText1: GoogleFonts.sourceSansPro(
      //   color: primaryTextColor,
      //   fontSize: 16,
      //   fontWeight: FontWeight.w400,
      // ),
      bodyText2: GoogleFonts.sourceSansPro(
        color: primaryTextColor,
        fontSize: 16,
      ),
      subtitle1: GoogleFonts.sourceSansPro(
        color: primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      // subtitle2: GoogleFonts.sourceSansPro(
      //   color: primaryTextColor,
      //   fontSize: 20,
      //   fontWeight: FontWeight.normal,
      // ),
      // button: GoogleFonts.sourceSansPro(
      //   color: primaryTextColor,
      //   fontSize: 15,
      //   fontWeight: FontWeight.normal,
      // ),
      // caption: GoogleFonts.sourceSansPro(
      //   color: primaryTextColor,
      //   fontSize: 26,
      //   fontWeight: FontWeight.normal,
      // ),
      // overline: GoogleFonts.sourceSansPro(
      //   color: primaryTextColor,
      //   fontSize: 11,
      //   fontWeight: FontWeight.normal,
      // ),
    );
  }

  static InputDecorationTheme inputDecorationTheme(
      Color primaryBackgroundColor,
      Color primaryColor,
      Color primaryBorderColor,
      Color error,
      Color hintText) {
    return InputDecorationTheme(
      fillColor: primaryBackgroundColor,
      contentPadding: const EdgeInsets.only(left: 24, right: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryBorderColor, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryBorderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryBorderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: error, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: error, width: 1),
      ),
      errorStyle: GoogleFonts.sourceSansPro(
        color: error,
        fontSize: 13,
      ),
      labelStyle: GoogleFonts.sourceSansPro(
        color: primaryColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      hintStyle: GoogleFonts.sourceSansPro(
        color: hintText,
        fontSize: 16,
      ),
    );
  }

// static ThemeData get darkTheme => createTheme(
//       brightness: Brightness.dark,
//       primaryColor: AppColor.primaryColorDark,
//       primaryBackgroundColor: AppColor.primaryBackgroundColorDark,
//       primaryTextColor: AppColor.primaryTextColorDark,
//       secondTextColor: AppColor.secondTextColorDark,
//       hintText: AppColor.primaryHintColorDark,
//       accentColor: AppColor.accentColorDark,
//       divider: AppColor.dividerColorDark,
//       disabled: AppColor.disabledColorDark,
//       shadowColor: AppColor.shadowColorDark,
//       primaryBorderColor: AppColor.primaryBorderColorDark,
//       error: AppColor.errorColorDark,
//     );
}
