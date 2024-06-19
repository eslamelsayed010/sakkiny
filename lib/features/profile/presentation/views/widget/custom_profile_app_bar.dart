import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

AppBar buildAppBarProfile(BuildContext context, text) {
  return AppBar(
    backgroundColor: kLogoColor,
    title: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    centerTitle: true,
  );
}
