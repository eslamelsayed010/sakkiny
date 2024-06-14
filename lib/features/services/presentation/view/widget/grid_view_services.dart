import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sakkiny/features/services/presentation/view/widget/custom_services.dart';

class GridViewServices extends StatelessWidget {
  const GridViewServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final aspectRatio = screenSize.width / (screenSize.height * 1.63);
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 12,
      childAspectRatio: 1 / 1.63,
      children: List.generate(
        10,
        (index) => const CustomServices(),
      ),
    );
  }
}
