import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: const Color(0xff0E0D0D),
      primaryColor: Colors.pink,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.grey[50],
          iconTheme: const IconThemeData(color: Colors.black)),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
      ));
}
