
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'baseDimentions.dart';

class S {
  

  static h1({Color? color, bool underline = false,TextDecoration? decoration,Color? decorationColor,double? decorationThickness, Color? shadowColor ,String? font}) =>
      GoogleFonts.notoKufiArabic(
  shadows: shadowColor == null ? null : shadow(color: shadowColor),
  color: color == null ? Colors.black : color,
  decoration:decoration!=null?decoration: underline ? TextDecoration.underline : null,
  decorationColor:decorationColor!=null?decorationColor:Colors.black ,
  decorationThickness:decorationThickness,
  fontSize: D.h1);

  static h2({Color? color, bool underline = false, TextDecoration? decoration,Color? decorationColor,double? decorationThickness,Color? shadowColor,String? font}) =>
      TextStyle(
          fontFamily: "Cairo",
          shadows: shadowColor == null ? null : shadow(color: shadowColor),
          color: color == null ? Colors.black : color,
          decoration:decoration!=null?decoration: underline ? TextDecoration.underline : null,
          decorationColor:decorationColor!=null?decorationColor:Colors.black ,
          decorationThickness:decorationThickness,
          fontSize: D.h2);

  static h3({Color? color, bool underline = false,TextDecoration? decoration, Color? decorationColor,double? decorationThickness,Color? shadowColor,String? font}) =>
      TextStyle(
          fontFamily: "Cairo",
          shadows: shadowColor == null ? null : shadow(color: shadowColor),
          color: color == null ? Colors.black : color,
          decoration:decoration!=null?decoration: underline ? TextDecoration.underline : null,
          decorationColor:decorationColor!=null?decorationColor:Colors.black ,
          decorationThickness:decorationThickness,
          fontSize: D.h3);

  static h4({Color? color, bool underline = false,TextDecoration? decoration,Color? decorationColor,double? decorationThickness, Color? shadowColor,String? font}) =>
      TextStyle(
          fontFamily: "Cairo",
          shadows: shadowColor == null ? null : shadow(color: shadowColor),
          color: color == null ? Colors.black : color,
          decoration:decoration!=null?decoration: underline ? TextDecoration.underline : null,
          decorationColor:decorationColor!=null?decorationColor:Colors.black ,
          decorationThickness:decorationThickness,
          fontSize: D.h4);

  static h5({Color? color, bool underline = false,TextDecoration? decoration,Color? decorationColor,double? decorationThickness, Color? shadowColor,String? font}) =>
      TextStyle(
          fontFamily: "Cairo",
          shadows: shadowColor == null ? null : shadow(color: shadowColor),
          color: color == null ? Colors.black : color,
          decoration:decoration!=null?decoration: underline ? TextDecoration.underline : null,
          decorationColor:decorationColor!=null?decorationColor:Colors.black ,
          decorationThickness:decorationThickness,
          fontSize: D.h5);

  static h6({Color? color, bool underline = false, TextDecoration? decoration,Color? decorationColor,double? decorationThickness,Color? shadowColor,String? font}) =>
      TextStyle(
          fontFamily: "Cairo",
          shadows: shadowColor == null ? null : shadow(color: shadowColor),
          color: color == null ? Colors.black : color,
          decoration:decoration!=null?decoration: underline ? TextDecoration.underline : null,
          decorationColor:decorationColor!=null?decorationColor:Colors.black ,
          decorationThickness:decorationThickness,
          fontSize: D.h6);

  static shadow({Color? color}) => [
    Shadow(
      blurRadius: 2.0,
      color: color == null ? Colors.black : color,
      offset: Offset(1.0, 1.0),
    ),
  ];
}
