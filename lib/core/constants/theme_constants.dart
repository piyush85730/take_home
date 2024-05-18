import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeColors {
  static const MaterialColor fontColor = MaterialColor(0xFF252525, <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFF252525),
    200: Color(0xFF252525),
    300: Color(0xFF252525),
    400: Color(0xFF252525),
    500: Color(0xFF252525),
    600: Color(0xFF252525),
    700: Color(0xFF252525),
    800: Color(0xFF252525),
    900: Color(0xFF252525),
  });

  static Color lightFontColor = fontColor.shade300;
  static Color titleColor = fontColor.shade500;
  static const Color clrBlack = Color(0xFF000000);
  static const Color clrWhite = Color(0xFFffffff);
  static const Color clrScaffoldBG = Color(0xFFF5F5F5);
  static const Color clrTransparent = Colors.transparent;
  static const Color clrGrey = Color(0xFFB9BABA);
  static const Color clrGreen = Colors.green;
  static const Color defaultFontColor = clrBlack;
}

// https://api.flutter.dev/flutter/material/Typography/englishLike2018-constant.html
class AppTheme {
  static AppBarTheme appBarTheme() => const AppBarTheme(
        titleSpacing: 20,
        elevation: 15,
        centerTitle: false,
        backgroundColor: ThemeColors.clrWhite,
        foregroundColor: ThemeColors.clrBlack,
        titleTextStyle: TextStyle(fontSize: 20, color: ThemeColors.clrBlack),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: ThemeColors.clrWhite,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: ThemeColors.clrWhite,
        ),
      );

  static TextTheme textTheme(BuildContext context) {
    final currentTextTheme = Theme.of(context).textTheme;
    const defaultTextColor = ThemeColors.defaultFontColor;
    return TextTheme(
      // Default values
      // fontSize: 96.0,
      // fontWeight: FontWeight.w300
      displayLarge:
          currentTextTheme.displayLarge!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 60.0,
      // fontWeight: FontWeight.w300
      displayMedium:
          currentTextTheme.displayMedium!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 48.0,
      // fontWeight: FontWeight.w400
      displaySmall:
          currentTextTheme.displaySmall!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 34.0,
      // fontWeight: FontWeight.w400
      headlineMedium:
          currentTextTheme.headlineMedium!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 24.0,
      // fontWeight: FontWeight.w400
      headlineSmall:
          currentTextTheme.headlineSmall!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 20.0,
      // fontWeight: FontWeight.w500
      titleLarge:
          currentTextTheme.titleLarge!.copyWith(color: defaultTextColor),

      labelMedium:
          currentTextTheme.titleLarge!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 16.0,
      // fontWeight: FontWeight.w400
      bodyLarge: currentTextTheme.bodyLarge!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 14.0,
      // fontWeight: FontWeight.w400
      bodyMedium:
          currentTextTheme.bodyMedium!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 16.0,
      // fontWeight: FontWeight.w400
      titleMedium:
          currentTextTheme.titleMedium!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 14.0,
      // fontWeight: FontWeight.w500
      titleSmall:
          currentTextTheme.titleSmall!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 14.0,
      // fontWeight: FontWeight.w500
      labelLarge:
          currentTextTheme.labelLarge!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 12.0,
      // fontWeight: FontWeight.w400
      bodySmall: currentTextTheme.bodySmall!.copyWith(color: defaultTextColor),

      // Default values
      // fontSize: 10.0,
      // fontWeight: FontWeight.w400
      labelSmall:
          currentTextTheme.labelSmall!.copyWith(color: defaultTextColor),
    );
  }

  /// Default theme data for Material and Elevated button
  static ButtonThemeData buttonThemeData(BuildContext context) =>
      Theme.of(context).buttonTheme.copyWith(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textTheme: ButtonTextTheme.primary,
            disabledColor: ThemeColors.clrGrey,
          );

  /// Theme data for Material and Elevated button
  static ElevatedButtonThemeData elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: ThemeColors.clrWhite,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      );

  /// Default style for label
  static TextStyle labelStyle(BuildContext context) => textTheme(context)
      .labelSmall!
      .copyWith(fontSize: 14, color: ThemeColors.lightFontColor);
}
