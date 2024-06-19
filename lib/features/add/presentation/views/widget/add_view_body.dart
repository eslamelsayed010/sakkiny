import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/features/add/presentation/views/widget/custom_add_buton.dart';
import 'package:sakkiny/features/add/presentation/views/widget/custom_add_container.dart';

class AddViewBody extends StatelessWidget {
  const AddViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AssetsData.animationHome2,
              height: 200,
            ),
          ],
        ),
        const Spacer(),
        const CustomAddContainer(
          text: 'Add your own property',
          icon: Icons.maps_home_work_outlined,
        ),
        const SizedBox(height: 25),
        const CustomAddContainer(
          text: 'View property evaluation',
          icon: Icons.elevator_outlined,
        ),
        const SizedBox(height: 25),
        const CustomAddContainer(
          text: 'Add your Service',
          icon: Icons.cleaning_services_outlined,
        ),
        const SizedBox(height: 25),
        const Spacer(),
        const CustomAddButon(),
        const SizedBox(height: 25),
      ],
    );
  }
}
