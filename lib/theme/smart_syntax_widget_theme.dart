/*
collection of default themes
 */

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smart_syntax_widget/theme/smart_syntax_widget_theme_collection.dart';

/// default themes provided by this package
class SmartSyntaxWidgetThemeCollection {
  static const thinkbuddyFontFamily = 'SFMono';

  /// default theme used by SmartSyntaxWidget widget
  static const defaultTheme = SmartSyntaxWidgetTheme();

  static const thinkBuddyTheme = SmartSyntaxWidgetTheme(
    classStyle: TextStyle(
      color: Color(0xffA6E22E),
      fontFamily: thinkbuddyFontFamily,
    ),
    staticStyle: TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0),
      fontFamily: thinkbuddyFontFamily,
    ),
    constructor: TextStyle(
      color: Color.fromRGBO(113, 176, 251, 1),
      fontFamily: thinkbuddyFontFamily,
    ),
    multilineComment: TextStyle(
      color: Color.fromRGBO(187, 174, 170, 1),
      fontFamily: thinkbuddyFontFamily,
    ),
    comment: TextStyle(
      color: Color(0xff88846f),
      fontFamily: thinkbuddyFontFamily,
    ),
    keyword: TextStyle(
      color: Color(0xffF92672),
      fontFamily: thinkbuddyFontFamily,
      fontWeight: FontWeight.bold,
    ),
    identifier: TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1),
      fontFamily: thinkbuddyFontFamily,
    ),
    function: TextStyle(
      color: Color(0xffA6E22E),
      fontFamily: thinkbuddyFontFamily,
    ),
    number: TextStyle(
      color: Color(0xffAE81FF),
      fontFamily: thinkbuddyFontFamily,
    ),
    string: TextStyle(
      fontFamily: thinkbuddyFontFamily,
      color: Color(0xffE6DB74),
    ),
    operator: TextStyle(
      color: Color.fromRGBO(251, 114, 116, 0.807843137254902),
      fontFamily: thinkbuddyFontFamily,
      fontWeight: FontWeight.bold,
    ),
    separator: TextStyle(
      color: Color(0xff0366d6),
      fontFamily: thinkbuddyFontFamily,
    ),
    method: TextStyle(
      color: Color.fromRGBO(200, 132, 251, 1),
      fontFamily: thinkbuddyFontFamily,
    ),
    private: TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0),
      fontFamily: thinkbuddyFontFamily,
    ),
    fontFamily: thinkbuddyFontFamily,
    fontFeatures: [FontFeature.slashedZero()],
  );

  /// freeLine theme
  static SmartSyntaxWidgetTheme freeLineTheme() {
    const black = TextStyle(
      color: Colors.black,
    );
    const blackNBold = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
    const comment = TextStyle(
      color: Color.fromRGBO(128, 119, 118, 1),
      fontStyle: FontStyle.italic,
    );
    return const SmartSyntaxWidgetTheme(
        classStyle: black,
        staticStyle: black,
        constructor: black,
        multilineComment: comment,
        comment: comment,
        keyword: blackNBold,
        identifier: black,
        function: black,
        number: TextStyle(
          color: Color.fromRGBO(99, 196, 178, 1),
        ),
        string: TextStyle(
          color: Color.fromRGBO(194, 34, 36, 1),
        ),
        operator: black,
        separator: black,
        method: black,
        private: black,
        lineNumber: TextStyle(color: Colors.black),
        fontFeatures: [FontFeature.slashedZero()]);
  }
}
