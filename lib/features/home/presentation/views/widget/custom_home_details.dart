import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/home/presentation/views/widget/custom_home_image.dart';

class CustomHomeDetails extends StatelessWidget {
  const CustomHomeDetails({Key? key, required this.property}) : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.kSelectedView,
            extra: property,
          );
        },
        child: Column(
          children: [
            CustomHomeImage(image: property.propertyImages![0].secureUrl!),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    property.type!,
                    style: const TextStyle(
                      color: kLogoColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'LE ${property.price}/${property.per}',
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: kLocationColor,
                ),
                Text(
                  property.address!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: kLocationColor,
                  ),
                ),
              ],
            ),
            // Row(
            //   children: const [
            //     Icon(Icons.bed),
            //     SizedBox(width: 10),
            //     Text('4 Rooms'),
            //     SizedBox(width: 20),
            //     Icon(Icons.photo_size_select_small),
            //     SizedBox(width: 10),
            //     Text('400 M'),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
