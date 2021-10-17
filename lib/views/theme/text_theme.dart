import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucms/views/theme/color_theme.dart';

/*
 * 필독!!!!!!!
 * 폰트사이즈 변수 받을 때 변수 타입을 지정해줘야 런타임에서 에러가 안나요!
 * TODO HERE
 */

TextStyle h1({bold = true}) => GoogleFonts.notoSans(
    fontSize: 30.0,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    color: mainTextColor());
TextStyle h2({bold = true}) => GoogleFonts.notoSans(
    fontSize: 25.0,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    color: mainTextColor());
TextStyle h3({bold = true}) =>
    GoogleFonts.notoSans(fontSize: 20.0, color: mainTextColor());

TextStyle warning({bold = true}) => GoogleFonts.notoSans(
    fontSize: 15.0,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    color: Colors.red.shade400);

TextStyle bold({double fontSize = 20.0, bold = true}) => GoogleFonts.notoSans(
    fontSize: fontSize, fontWeight: FontWeight.bold, color: mainTextColor());

TextStyle body({double fontSize = 20.0, bold = true}) => GoogleFonts.notoSans(
    fontSize: fontSize,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    color: mainTextColor());

TextStyle small({double fontSize = 10.0, bold = true}) => GoogleFonts.notoSans(
    fontSize: fontSize,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    color: mainTextColor());

TextStyle footerStyle({double fontSize = 10.0}) =>
    GoogleFonts.notoSans(fontSize: fontSize, color: footerTextColor());
