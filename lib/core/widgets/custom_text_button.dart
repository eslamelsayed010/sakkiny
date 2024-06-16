import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.onPressed,
    required this.text,
    required this.textButton,
    this.txtColor = kLogoColor,
    this.fontSize1,
    this.fontSize2,
  }) : super(key: key);

  final void Function()? onPressed;
  final String textButton;
  final String text;
  final Color? txtColor;
  final double? fontSize1;
  final double? fontSize2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize1,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: TextStyle(color: txtColor, fontSize: fontSize2),
          ),
        ),
      ],
    );
  }
}
