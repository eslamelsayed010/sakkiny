import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, Color backgroundColor,
    {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(child: Text(message)),
      backgroundColor: backgroundColor,
    ),
  );
}
