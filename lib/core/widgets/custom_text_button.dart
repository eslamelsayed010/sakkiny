import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.onPressed,
    required this.text,
    required this.textButton,
  }) : super(key: key);

  final void Function()? onPressed;
  final String textButton;
  final String text;

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
            style: const TextStyle(color: kLogoColor),
          ),
        ),
      ],
    );
  }
}
