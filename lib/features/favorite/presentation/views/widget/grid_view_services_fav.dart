import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sakkiny/features/favorite/presentation/views/widget/custom_services_fav.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/get_service_model.dart';


class GridViewServicesFav extends StatelessWidget {
  const GridViewServicesFav({Key? key, required this.favServiceModel,}) : super(key: key);
  final GetServiceModel favServiceModel;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 12,
      childAspectRatio: 1 / 1.63,
      children: List.generate(
       favServiceModel.services!.length,
        (index) =>  CustomServicesFav(service:favServiceModel.services![index] ,),
      ),
    );
  }
}
