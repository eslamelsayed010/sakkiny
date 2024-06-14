import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

ThemeData buildThemeData() {
  return ThemeData(
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: const Color(0xffffffff),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: kLogoColor),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    ),
    sliderTheme: const SliderThemeData(
      trackHeight: 1,
      activeTrackColor: kLogoColor,
      inactiveTrackColor: Color(0xff4f4b6e),
      thumbColor: kLogoColor,
      overlayColor: Colors.transparent,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7),
      rangeThumbShape: RoundRangeSliderThumbShape(
        enabledThumbRadius: 7.0,
      ),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
    ),
  );
}
