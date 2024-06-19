import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomButon extends StatelessWidget {
  const CustomButon({
    super.key,
    this.height = 45,
    this.width,
    this.radius = 50,
    this.background = kLogoColor,
    this.onPressed,
    required this.text,
    this.addLogo = false,
    this.isLoading = false,
    this.withBorder = false,
    this.marginHorizontal = 0,
    this.marginBottom = 0,
    this.itemLogo,
    this.colorLoadingIndicator = Colors.white,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.all(8),
    this.fontSize,
    this.borderColor = Colors.grey,
  });
  final bool isLoading;
  final bool withBorder;
  final double? height;
  final double? width;
  final double radius;
  final Color? background;
  final void Function()? onPressed;
  final String text;
  final bool addLogo;
  final double marginHorizontal;
  final double marginBottom;
  final Widget? itemLogo;
  final Color? colorLoadingIndicator;
  final Color? textColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: EdgeInsets.only(
        left: marginHorizontal,
        right: marginHorizontal,
        bottom: marginBottom,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: withBorder
            ? Border.all(
                color: borderColor!,
                width: 2,
              )
            : null,
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            isLoading
                ? CircularProgressIndicator(
                    color: colorLoadingIndicator,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            if (addLogo == true && isLoading == false) itemLogo!
          ],
        ),
      ),
    );
  }
}
