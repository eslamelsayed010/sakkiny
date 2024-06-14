import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomFurnished extends StatefulWidget {
  const CustomFurnished({Key? key}) : super(key: key);
  @override
  State<CustomFurnished> createState() => _CustomFurnishedState();
}

class _CustomFurnishedState extends State<CustomFurnished> {
  bool isFurnished = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Furnished',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isFurnished = true;
                });
              },
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: isFurnished ? kLogoColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isFurnished ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 40),
            InkWell(
              onTap: () {
                setState(() {
                  isFurnished = false;
                });
              },
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: isFurnished ? Colors.transparent : kLogoColor,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: Text(
                    'No',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isFurnished ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
