import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';

class RentSection extends StatelessWidget {
  const RentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          'LE 3000 / Month',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kLogoColor,
          ),
        ),
        Spacer(),
        CustomButon(
          text: 'RENT',
          addLogo: true,
          itemLogo: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 20,
            ),
          ),
          radius: 10,
        ),
      ],
    );
  }
}
