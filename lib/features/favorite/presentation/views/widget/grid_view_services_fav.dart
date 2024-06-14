import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sakkiny/features/favorite/presentation/views/widget/custom_services_fav.dart';

class GridViewServicesFav extends StatelessWidget {
  const GridViewServicesFav({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final aspectRatio = screenSize.width / (screenSize.height * 1.63);
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 12,
      childAspectRatio: 1 / 1.63,
      children: List.generate(
        10,
        (index) => const CustomServicesFav(),
      ),
    );
  }
}
