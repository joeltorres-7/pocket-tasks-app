import 'dart:ui';

import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle heading1 = const TextStyle(
      fontFamily: 'CerebriSansPro',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black);
  static TextStyle headingNav = const TextStyle(
      fontFamily: 'CerebriSansPro',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black54);
  static TextStyle subheading1 = const TextStyle(
      fontFamily: 'CerebriSansPro',
      fontSize: 16,
      height: 1.6,
      fontWeight: FontWeight.normal,
      color: Colors.black);
  static TextStyle regular = const TextStyle(
      fontFamily: 'CerebriSansPro',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black);
  static TextStyle regularMedium14 = const TextStyle(
      fontFamily: 'CerebriSansPro',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.black);
  static TextStyle regular14 = const TextStyle(
      fontFamily: 'CerebriSansPro',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.black);
  static TextStyle regularGray14 = const TextStyle(
      fontFamily: 'CerebriSansPro',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Color(0xFF666666)
  );
  static TextStyle smallLabel = const TextStyle(
      fontFamily: 'CerebriSansPro',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Color(0xFF666666),
  );

  static const TextStyle boldHeading = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black, // Set the desired color
  );

  static const TextStyle boldSubheading = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.black, // Set the desired color
  );

}
