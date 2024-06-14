import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/assets.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: const [
        CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(AssetsData.loma3),
        ),
        Positioned(
          bottom: 2.5,
          right: 2.5,
          child: CircleAvatar(
            radius: 6,
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          bottom: 3,
          right: 3,
          child: CircleAvatar(
            radius: 5,
            backgroundColor: Colors.green,
          ),
        )
      ],
    );
  }
}
