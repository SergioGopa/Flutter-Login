import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
   // === TITULARES (Montserrat Alternates) ===
  static final h1Bold = GoogleFonts.montserratAlternates(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 34 / 28, // lineHeight / fontSize
  );
  static final h1 = GoogleFonts.montserratAlternates(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    height: 34 / 28,
  );


  static final h2SemiBold = GoogleFonts.montserratAlternates(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 30 / 20,
  );

  static final h2 = GoogleFonts.workSans(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    height: 30 / 20,
  );

  // === TEXTO (Work Sans) ===
  static final t1Regular = GoogleFonts.workSans(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 22 / 18,
  );

  static final t1Bold = GoogleFonts.workSans(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    height: 22 / 18,
  );

  static final t2Regular = GoogleFonts.workSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 19 / 16,
  );

  static final t2Italic = GoogleFonts.workSans(
    fontSize: 16,
    fontStyle: FontStyle.italic,
    height: 19 / 16,
  );

  static final t3Bold = GoogleFonts.workSans(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 17 / 14,
  );

  static final t3BoldUnderlined = GoogleFonts.workSans(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    height: 17 / 14,
  );

  static final t4Regular = GoogleFonts.workSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 14 / 12,
  );
 }
