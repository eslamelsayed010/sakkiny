import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.onPressed,
    required this.text,
    required this.textButton,
    this.txtColor = kLogoColor,
  }) : super(key: key);

  final void Function()? onPressed;
  final String textButton;
  final String text;
  final Color? txtColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: TextStyle(color: txtColor),
          ),
        ),
      ],
    );
  }
}
