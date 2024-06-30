import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sakkiny/features/favorite/presentation/views/widget/custom_home_fav.dart';
import 'package:sakkiny/features/home/data/models/home_model/home_model.dart';

class GridViewHomeFav extends StatelessWidget {
  const GridViewHomeFav({Key? key, required this.favPropertyModel})
      : super(key: key);
  final HomeModel favPropertyModel;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 12,
      childAspectRatio: 1 / 1.47,
      children: List.generate(
        favPropertyModel.properties!.length,
        (index) => CustomHomeFav(
          property: favPropertyModel.properties![index],
        ),
      ),
    );
  }
}
