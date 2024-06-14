import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import '../../../../../core/utils/assets.dart';

class ImagePropertySection extends StatelessWidget {
  const ImagePropertySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            AssetsData.getStartD1,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              const Spacer(),
              Material(
                color: Colors.transparent,
                elevation: 5,
                shape: const CircleBorder(),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: kLogoColor,
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kEditPropertyView);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
