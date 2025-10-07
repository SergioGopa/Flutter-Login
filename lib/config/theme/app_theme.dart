import 'package:eisty/config/theme/theme.dart';
import 'package:flutter/material.dart';

class SazanTheme {
  static ThemeData getTheme({bool isDarkmode = false}) {
    if (isDarkmode) {
      return ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.casiNegro,
          primaryColor: AppColors.rosaPrimario,
          colorScheme: ColorScheme.dark().copyWith(
              primary: AppColors.rosaPrimario,
              secondary: AppColors.amarilloAcento,
              error: AppColors.rojoError,
              surface: AppColors.casiNegro),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.casiNegro,
            elevation: 0,
            titleTextStyle:
                AppTextStyles.h2SemiBold.copyWith(color: AppColors.blancoSazan),
            iconTheme: const IconThemeData(color: AppColors.blancoSazan),
            centerTitle: true,
          ),
          textTheme: TextTheme(
            headlineLarge:
                AppTextStyles.h1Bold.copyWith(color: AppColors.blancoSazan),
            headlineMedium:
                AppTextStyles.h2.copyWith(color: AppColors.blancoSazan),
            headlineSmall:
                AppTextStyles.h2SemiBold.copyWith(color: AppColors.blancoSazan),
            titleLarge:
                AppTextStyles.t1Bold.copyWith(color: AppColors.blancoSazan),
            titleMedium:
                AppTextStyles.t2Regular.copyWith(color: AppColors.gris2),
            titleSmall:
                AppTextStyles.t3Bold.copyWith(color: AppColors.blancoSazan),
            bodyLarge:
                AppTextStyles.t1Regular.copyWith(color: AppColors.blancoSazan),
            bodyMedium:
                AppTextStyles.t2Regular.copyWith(color: AppColors.blancoSazan),
            bodySmall: AppTextStyles.t4Regular.copyWith(color: AppColors.gris2),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.rosaPrimario,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              textStyle:
                  AppTextStyles.t1Bold.copyWith(color: AppColors.blancoPuro),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: AppColors.gris4,
            hintStyle: AppTextStyles.t2Regular.copyWith(color: AppColors.gris2),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.gris3)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColors.rosaPrimario, width: 2),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.rojoError)),
          ));
    } else {
      return ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.blancoSazan,
        primaryColor: AppColors.rosaPrimario,
        colorScheme: ColorScheme.light().copyWith(
            primary: AppColors.rosaPrimario,
            secondary: AppColors.amarillo4,
            error: AppColors.rojoError,
            surface: AppColors.blancoSazan),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blancoSazan,
          elevation: 0,
          titleTextStyle:
              AppTextStyles.h2SemiBold.copyWith(color: AppColors.negroPuro),
          iconTheme: const IconThemeData(color: AppColors.negroPuro),
          centerTitle: true,
        ),
        textTheme: TextTheme(
          headlineLarge:
              AppTextStyles.h1Bold.copyWith(color: AppColors.negroPuro),
          headlineMedium: AppTextStyles.h2.copyWith(color: AppColors.negroPuro),
          headlineSmall:
              AppTextStyles.h2SemiBold.copyWith(color: AppColors.negroPuro),
          titleLarge: AppTextStyles.t1Bold.copyWith(color: AppColors.negroPuro),
          titleMedium: AppTextStyles.t2Regular.copyWith(color: AppColors.gris3),
          titleSmall: AppTextStyles.t3Bold.copyWith(color: AppColors.negroPuro),
          bodyLarge: AppTextStyles.t1Regular.copyWith(color: AppColors.negroPuro),
          bodyMedium:
              AppTextStyles.t2Regular.copyWith(color: AppColors.negroPuro),
          bodySmall: AppTextStyles.t4Regular.copyWith(color: AppColors.gris3),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.rosaPrimario,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: AppTextStyles.t1Bold.copyWith(color: AppColors.blancoPuro),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.blanco4,
          hintStyle: AppTextStyles.t2Italic.copyWith(color: AppColors.gris3),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.gris)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.rosaPrimario, width: 2),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.rojoError)),
        )
      );
    }
  }
}
