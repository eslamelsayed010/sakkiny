import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.color = Colors.grey,
    this.padding,
    this.width = double.infinity,
    this.paddingHorizontal = 20,
    this.paddingVertical = 10,
  }) : super(key: key);

  final double paddingHorizontal;
  final double paddingVertical;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: paddingVertical,
          ),
      child: Container(
        height: 1,
        width: width,
        color: color,
      ),
    );
  }
}

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey[300],
      ),
    );
