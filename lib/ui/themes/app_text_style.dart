import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static final header24Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.16,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final header20SemiBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final header16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    height: 1.25,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final header14Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final header14SemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final text32Bold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final text20Regular = TextStyle(
    fontSize: 20,
    letterSpacing: 0,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final text16Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final text16Regular = TextStyle(
    fontSize: 16,
    letterSpacing: 0.16,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final text14Regular = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final text12SemiBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 20 / 12,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final text12Regular = TextStyle(
    fontSize: 12,
    height: 20 / 12,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static final linkText = TextStyle(
    fontSize: 16,
    letterSpacing: 0.16,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
}
