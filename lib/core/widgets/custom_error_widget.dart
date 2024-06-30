import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.errorMassage, this.color = Colors.red})
      : super(key: key);
  final String errorMassage;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Text(
          errorMassage,
          style: TextStyle(
            fontSize: 18,
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
