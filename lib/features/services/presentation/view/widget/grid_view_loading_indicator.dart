import 'package:flutter/material.dart';
import 'package:sakkiny/features/services/presentation/view/widget/custom_loading_indicator_home_products.dart';

class GridViewLoadingIndicator extends StatelessWidget {
  const GridViewLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1 / 1.72,
        children: List.generate(
          10,
          (index) => const CustomLoadingIndicatorHomeProducts(),
        ),
      ),
    );
  }
}
