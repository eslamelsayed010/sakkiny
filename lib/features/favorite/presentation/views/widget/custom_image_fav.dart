import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomImageFav extends StatelessWidget {
  const CustomImageFav({
    super.key,
    this.isHome = false,
  });
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Image.asset(
          isHome ? AssetsData.getStartD2 : AssetsData.services,
          height: 150,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.favorite_outlined,
              color: kLogoColor,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
