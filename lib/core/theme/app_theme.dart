import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AppTheme {
  static const String fontFamily = 'IBMPlexSansArabic';

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      brightness: Brightness.light,
      primaryColor: ColorsManager.primaryColor,
      scaffoldBackgroundColor: ColorsManager.white,
      colorScheme: const ColorScheme.light(
        primary: ColorsManager.primaryColor,
        secondary: ColorsManager.secondary500,
        error: ColorsManager.errorColor,
        surface: ColorsManager.white,
        onPrimary: ColorsManager.white,
        onSecondary: ColorsManager.black,
        onError: ColorsManager.white,
        onSurface: ColorsManager.black,
      ),
      appBarTheme: _appBarTheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
      cardTheme: _cardTheme,
      bottomNavigationBarTheme: _bottomNavBarTheme,
      checkboxTheme: _checkboxTheme,
      radioTheme: _radioTheme,
      switchTheme: _switchTheme,
      dividerTheme: _dividerTheme,
      bottomSheetTheme: _bottomSheetTheme,
      dialogTheme: _dialogTheme,
      snackBarTheme: _snackBarTheme,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // APP BAR THEME
  // ═══════════════════════════════════════════════════════════
  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: ColorsManager.white,
      surfaceTintColor: ColorsManager.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorsManager.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: const IconThemeData(
        color: ColorsManager.black,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManager.black,
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // TEXT THEME
  // ═══════════════════════════════════════════════════════════
  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      displayMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      displaySmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      headlineLarge: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      headlineMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      headlineSmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      titleLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkGray,
        fontFamily: fontFamily,
      ),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
        fontFamily: fontFamily,
      ),
      labelMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.darkGray,
        fontFamily: fontFamily,
      ),
      labelSmall: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkGray,
        fontFamily: fontFamily,
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // INPUT DECORATION THEME
  // ═══════════════════════════════════════════════════════════
  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: false,
      fillColor: ColorsManager.grey100,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),

      // Hint Style
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkGray300,
        fontFamily: fontFamily,
      ),

      // Label Style
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkGray,
        fontFamily: fontFamily,
      ),

      // Floating Label Style
      floatingLabelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.primaryColor,
        fontFamily: fontFamily,
      ),

      // Helper Style
      helperStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkGray,
        fontFamily: fontFamily,
      ),

      // Error Style
      errorStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.errorColor,
        fontFamily: fontFamily,
      ),

      // Prefix/Suffix Style
      prefixStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkGray,
        fontFamily: fontFamily,
      ),
      suffixStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkGray,
        fontFamily: fontFamily,
      ),

      // Counter Style
      counterStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkGray,
        fontFamily: fontFamily,
      ),

      // Icon Colors
      prefixIconColor: ColorsManager.darkGray,
      suffixIconColor: ColorsManager.darkGray,

      // Borders
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: ColorsManager.dark200, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: ColorsManager.dark200, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: ColorsManager.primaryColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: ColorsManager.errorColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: ColorsManager.errorColor, width: 1.5),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: ColorsManager.grey200, width: 1),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // ELEVATED BUTTON THEME
  // ═══════════════════════════════════════════════════════════
  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primaryColor,
        foregroundColor: ColorsManager.white,
        disabledBackgroundColor: ColorsManager.darkGray300,
        disabledForegroundColor: ColorsManager.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // OUTLINED BUTTON THEME
  // ═══════════════════════════════════════════════════════════
  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorsManager.primaryColor,
        side: const BorderSide(color: ColorsManager.primaryColor, width: 1.5),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // TEXT BUTTON THEME
  // ═══════════════════════════════════════════════════════════
  static TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorsManager.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // CARD THEME (تم التصحيح)
  // ═══════════════════════════════════════════════════════════
  static CardThemeData get _cardTheme {
    return CardThemeData(
      color: ColorsManager.white,
      elevation: 2,
      shadowColor: ColorsManager.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      margin: EdgeInsets.all(8.w),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // BOTTOM NAVIGATION BAR THEME
  // ═══════════════════════════════════════════════════════════
  static BottomNavigationBarThemeData get _bottomNavBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.white,
      selectedItemColor: ColorsManager.primaryColor,
      unselectedItemColor: ColorsManager.darkGray,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // CHECKBOX THEME
  // ═══════════════════════════════════════════════════════════
  static CheckboxThemeData get _checkboxTheme {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsManager.primaryColor;
        }
        return ColorsManager.transparent;
      }),
      checkColor: WidgetStateProperty.all(ColorsManager.white),
      side: const BorderSide(color: ColorsManager.darkGray300, width: 1.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // RADIO THEME
  // ═══════════════════════════════════════════════════════════
  static RadioThemeData get _radioTheme {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsManager.primaryColor;
        }
        return ColorsManager.darkGray300;
      }),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SWITCH THEME
  // ═══════════════════════════════════════════════════════════
  static SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsManager.white;
        }
        return ColorsManager.darkGray;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsManager.primaryColor;
        }
        return ColorsManager.grey200;
      }),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // DIVIDER THEME
  // ═══════════════════════════════════════════════════════════
  static DividerThemeData get _dividerTheme {
    return DividerThemeData(
      color: ColorsManager.grey200,
      thickness: 1,
      space: 16.h,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // BOTTOM SHEET THEME
  // ═══════════════════════════════════════════════════════════
  static BottomSheetThemeData get _bottomSheetTheme {
    return BottomSheetThemeData(
      backgroundColor: ColorsManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      showDragHandle: true,
      dragHandleColor: ColorsManager.grey200,
      dragHandleSize: Size(40.w, 4.h),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // DIALOG THEME (تم التصحيح)
  // ═══════════════════════════════════════════════════════════
  static DialogThemeData get _dialogTheme {
    return DialogThemeData(
      backgroundColor: ColorsManager.white,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManager.black,
        fontFamily: fontFamily,
      ),
      contentTextStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkGray,
        fontFamily: fontFamily,
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SNACKBAR THEME
  // ═══════════════════════════════════════════════════════════
  static SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      backgroundColor: ColorsManager.dark500,
      contentTextStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white,
        fontFamily: fontFamily,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      behavior: SnackBarBehavior.floating,
      insetPadding: EdgeInsets.all(16.w),
    );
  }
}