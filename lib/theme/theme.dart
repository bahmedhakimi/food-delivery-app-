// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
      primaryColor: primaryClr,
      backgroundColor: primaryClr,
      brightness: Brightness.light);
  static final dark = ThemeData(
      primaryColor: white, backgroundColor: white, brightness: Brightness.dark);

  static headinstyle(
      {required BuildContext context,
      required double defaultValue,
      required double mobilesize,
      required double tabletsize,
      required double desktopsize}) {
    return GoogleFonts.oswald(
        textStyle: TextStyle(
            fontSize: ResponsiveValue(
              context,
              defaultValue: defaultValue,
              valueWhen: [
                Condition.smallerThan(
                  name: MOBILE,
                  value: mobilesize,
                ),
                Condition.smallerThan(
                  name: TABLET,
                  value: tabletsize,
                ),
                Condition.smallerThan(
                  name: DESKTOP,
                  value: tabletsize,
                )
              ],
            ).value,
            fontWeight: FontWeight.bold,
            color: Colors.black));
  }

  static subtitestyle(
      {required BuildContext context,
      required double defaultValue,
      required double mobilesize,
      required double tabletsize,
      required double desktopsize}) {
    return GoogleFonts.oswald(
        textStyle: TextStyle(
            fontSize: ResponsiveValue(
              context,
              defaultValue: defaultValue,
              valueWhen: [
                Condition.smallerThan(
                  name: MOBILE,
                  value: mobilesize,
                ),
                Condition.smallerThan(
                  name: TABLET,
                  value: tabletsize,
                ),
                Condition.smallerThan(
                  name: DESKTOP,
                  value: tabletsize,
                )
              ],
            ).value,
            fontWeight: FontWeight.w500,
            color: Colors.black87));
  }

  static bodystyle(
      {required BuildContext context,
      required double defaultValue,
      required double mobilesize,
      required double tabletsize,
      required double desktopsize}) {
    return GoogleFonts.oswald(
        textStyle: TextStyle(
            fontSize: ResponsiveValue(
              context,
              defaultValue: defaultValue,
              valueWhen: [
                Condition.smallerThan(
                  name: MOBILE,
                  value: mobilesize,
                ),
                Condition.smallerThan(
                  name: TABLET,
                  value: tabletsize,
                ),
                Condition.smallerThan(
                  name: DESKTOP,
                  value: tabletsize,
                )
              ],
            ).value,
            fontWeight: FontWeight.w300,
            color: Colors.black));
  }
}
