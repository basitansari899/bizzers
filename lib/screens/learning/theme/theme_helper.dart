import 'dart:io';
import 'package:bizconnect/screens/learning/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../utils/exports.dart';
import '../core/phone_field/intl_phone_field.dart';
import '../core/utils/pref_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors(),
    'darkPrimary': PrimaryColors(),
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme,
    'darkPrimary': ColorSchemes.darkPrimaryColorScheme,
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme() {
    // _newTheme = _newTheme=="primary"?"darkPrimary":"primary";
    _appTheme = PrefUtils().getThemeData()=="primary"?"darkPrimary":"primary";

    PrefUtils().setThemeData(_appTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      dialogTheme: DialogTheme(backgroundColor: PrefUtils().getThemeData() == "primary"?appTheme.whiteA700:appTheme.darkInput),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appTheme.gray100,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray300,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray700,
          fontSize: 13.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 12.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 28.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 24.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 12.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 22.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 18.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 14.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF0047AD),
    primaryContainer: Color(0XFFD4D9FF),

    // Error colors
    onErrorContainer: Color(0XFFF5F5F5),

    // On colors(text colors)
    onPrimary: Color(0XFF030401),
    onPrimaryContainer: Color(0XFF292D32),
  );

  static final darkPrimaryColorScheme = ColorScheme.dark(
    // Primary colors
    primary: Color(0XFF0047AD),
    primaryContainer: Color(0XFFD4D9FF),

    // Error colors
    onErrorContainer: Color(0XFFF5F5F5),

    // On colors(text colors)
    onPrimary: Color(0XFF030401),
    onPrimaryContainer: Color(0XFF292D32),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber500 => Color(0XFFFFC107);
  Color get primaryColor => Color(0XFF0048AD);

  // Black
  Color get black900 => PrefUtils().getThemeData() == "primary"?Color(0XFF000000):Color(0XFFFFFFFF);

  // Blue
  Color get blue50 => Color(0XFFE4F2FF);
  Color get blue5001 => Color(0XFFDAE9FF);
  Color get blue800 => Color(0XFF226FA7);
  Color get blueA200 => Color(0XFF5186EE);
  Color get blueA20001 => Color(0XFF4E8FF2);

  // BlueGray
  Color get blueGray300 => Color(0XFFA3A3B5);

  // Cyan
  Color get cyan300 => Color(0XFF50C8E5);

  // DeepOrange
  Color get deepOrange300 => Color(0XFFFF9350);
  Color get deepOrange50 => Color(0XFFFFE3DD);
  Color get deepOrange600 => Color(0XFFFC4219);

  // DeepPurple
  Color get deepPurple50 => Color(0XFFECE4FF);
  Color get deepPurpleA200 => Color(0XFF9D50FF);

  // Gray
  Color get gray100 => Color(0XFFF4F4F4);
  Color get gray10001 => Color(0XFFF6F6F6);
  Color get gray10002 => Color(0XFFF7F7F7);
  Color get gray200 => Color(0XFFEDEDED);
  Color get gray300 => Color(0XFFDBDBDB);
  Color get gray400 => Color(0XFFC0BFBF);
  Color get gray600 => Color(0XFF6B6B6B);
  Color get gray700 => Color(0XFF696969);
  Color get black10 => Color(0XFFF4F4F4);
  Color get lightGray => Color(0XFFF8F8F8);

  // Green
  Color get greenA700 => Color(0XFF1FB76D);
  Color get greenA70001 => Color(0XFF04B155);

  // Indigo
  Color get indigo100 => Color(0XFFBBC2FF);
  Color get indigo10001 => Color(0XFFC0C7F8);
  Color get indigo50 => Color(0XFFE7E7FF);
  Color get indigo5001 => Color(0XFFE4E6FF);
  Color get indigo5002 => Color(0XFFE6EDF7);
  Color get indigo800 => Color(0XFF283593);
  Color get indigoA200 => Color(0XFF5061FF);

  // LightBlue
  Color get lightBlue50 => Color(0XFFDBF8FF);

  // Orange
  Color get orange50 => Color(0XFFFFEFE4);

  // Pink
  Color get pink300 => Color(0XFFED5A87);

  // Purple
  Color get purple50 => Color(0XFFF7E4FF);
  Color get purpleA200 => Color(0XFFD150FF);

  // Red
  Color get red50 => Color(0XFFFFEBF0);
  Color get red500 => Color(0XFFF14336);
  Color get red => Color(0XFFD93636);

  Color get red700 => Color(0XFFD83636);

  // Teal
  Color get teal50 => Color(0XFFDBF3E7);
  Color get darkInput => Color(0XFF252525);
  Color get lightPurple => Color(0XFFEDE4FF);
  Color get deepPurple => Color(0XFFE4E7FF);
  Color get purple => Color(0XFFF8E4FF);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
  Color get buttonColor => Color(0XFF0048AD);
  Color get borderColor => Color(0XFFC0C0C0);
  Color get bgColor => PrefUtils().getThemeData() == "primary"?Color(0XFFFFFFFF):Color(0XFF1D1D1D);
  Color get viewAllButtonColor => PrefUtils().getThemeData() == "primary"?Color(0XFF030401):Color(0XFFFFFFFF);
  Color get containerbgColor => PrefUtils().getThemeData() == "primary"?lightGray:darkInput;
  Color get iconButtonbgColor => PrefUtils().getThemeData() == "primary"?Color(0XFFFFFFFF):Color(0XFF1E1E1E);
  Color get progressBarColor => PrefUtils().getThemeData() == "primary"?Color(0XFFEDEDED):Color(0XFF2B2B2B);
  Color get gray => PrefUtils().getThemeData() == "primary"?Color(0XFFF5F5F5):darkInput;
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
closeApp() {
  Future.delayed(const Duration(milliseconds: 1000), () {
    SystemNavigator.pop();
  });
}

setSafeAreaColor({Color? color}){
  SystemChrome.setSystemUIOverlayStyle(



    Platform.isIOS?SystemUiOverlayStyle(
      statusBarColor:color??appTheme.bgColor,
      systemNavigationBarColor: color??appTheme.bgColor,
      statusBarIconBrightness: PrefUtils().getThemeData() == "primary"?Brightness.light:Brightness.dark,
      systemNavigationBarIconBrightness: PrefUtils().getThemeData() == "primary"?Brightness.light:Brightness.dark,
    ):SystemUiOverlayStyle(
      statusBarColor:color??appTheme.bgColor,
      systemNavigationBarColor: color??appTheme.bgColor,
      statusBarIconBrightness: PrefUtils().getThemeData() == "primary"?Brightness.dark:Brightness.light,
      systemNavigationBarIconBrightness: PrefUtils().getThemeData() == "primary"?Brightness.dark:Brightness.light,
    ),
  );
}
Widget animationfunction(index, child,
    {Duration? listAnimation, Duration? slideduration, Duration? slidedelay}) {
  return AnimationConfiguration.staggeredList(
    position: index,
    duration: listAnimation ?? Duration(milliseconds: 375),
    child: SlideAnimation(
      duration: slideduration ?? Duration(milliseconds: 50),
      delay: slidedelay ?? Duration(milliseconds: 50),
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
}
getCustomToast(text){
  return Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor:appTheme.buttonColor,
    textColor: Colors.white,
    fontSize: 16.fSize,
  );
}

Widget phone_number_field(controller,String? Function(String?)? validator){
  return  IntlPhoneField(
    controller: controller,
    disableLengthCheck: true,
    showCountryFlag: false,
    flagsButtonPadding: EdgeInsets.zero,
    flagsButtonMargin: EdgeInsets.only(
        left: 16.h, right: 14.h),
    style: TextStyle(
      color: appTheme.black900,
      fontSize: 16.fSize,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w400,
    ),
    dropdownTextStyle: TextStyle(
      color: appTheme.black900,
      fontSize: 16.fSize,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w400,
    ),

    cursorColor: appTheme.buttonColor,
    dropdownIconPosition: IconPosition.trailing,
    dropdownDecoration: BoxDecoration(
      // border: Border(
      //     right: BorderSide(
      //         color: ColorConstant.gray300))
    ),
    dropdownIcon: Icon(
      Icons.keyboard_arrow_down_outlined,
      color: PrefUtils().getThemeData() == "primary"?appTheme.black900:Colors.white,
    ),
    validator: validator,

    //     (p0) {
    //   if (p0 == null || p0.number.isEmpty) {
    //     return "Enter valid number";
    //   }
    //   return null;
    // },
    decoration: InputDecoration(
      floatingLabelStyle: TextStyle(
        color:appTheme.black900,
        fontSize: 16.fSize,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w400,
      ),
      contentPadding: EdgeInsets.zero,
      // labelStyle: TextStyle(
      //   color: ColorConstant.black900,
      //   fontSize: getFontSize(
      //     13,
      //   ),
      //   fontFamily: 'Outfit',
      //   fontWeight: FontWeight.w400,
      // ),
      // labelText: "Phone number",

      // label: Align(alignment: Alignment.topLeft,child: Text("Phone number",textAlign: TextAlign.left,)),
      hintText: "Phone number",
      // hintStyle:CustomTextStyles.bodyLargeblack40.copyWith(color:  PrefUtils().getThemeData() == "primary"?appTheme.black40:appTheme.whiteA700),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(12.h)),
        borderSide: BorderSide(
          color: appTheme.red,
          width: 1,
        ),
      ),
      focusedErrorBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(12.h)),
        borderSide: BorderSide(
          color: appTheme.red,
          width: 1,
        ),
      ),
      enabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.h),
        borderSide: BorderSide(
          color: appTheme.borderColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.h),
        borderSide: BorderSide(
          color: appTheme.buttonColor,
          width: 1,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(),
      ),
    ),
    initialCountryCode: 'IN',
    onChanged: (phone) {
      print(phone.completeNumber);
    },
  );
}