import 'package:flutter/material.dart';

class AppDecoration {
  // Gradient decorations
  static BoxDecoration get gradientBlueGrayToBlue => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, 0),
          end: Alignment(1, 1),
          colors: [
            Color(0XFF07244E),
            Color(0XFF124CB4),
            Color(0XFF0B41AB),
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 71, 110, 154), // Top color
            Color.fromARGB(255, 13, 13, 69), // Bottom color
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0X19000000).withOpacity(0.25),
            spreadRadius: 2.0,
            blurRadius: 2.0,
            offset: Offset(0, 0),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90019 => BoxDecoration();
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(20);
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
