import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';

class BookSection extends StatelessWidget {
  const BookSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          '40 LE for inspection ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kLogoColor,
            fontSize: 13,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Spacer(),
        CustomButon(
          text: 'Booking Now',
          radius: 10,
        ),
      ],
    );
  }
}
