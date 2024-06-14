import 'package:flutter/material.dart';

class CustomContainerBottom extends StatelessWidget {
  const CustomContainerBottom({
    super.key,
    required this.onTap,
    required this.firstIcon,
    required this.text,
  });

  final void Function()? onTap;
  final IconData? firstIcon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.transparent,
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black38),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                firstIcon,
                color: Colors.black,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
