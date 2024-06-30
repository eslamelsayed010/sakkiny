import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/favorite/presentation/views/widget/custom_image_fav.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

class CustomHomeFav extends StatelessWidget {
  const CustomHomeFav({
    Key? key,
    required this.property,
  }) : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSelectedView, extra: property);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black26),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageFav(property: property),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.type!.tr(context),
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${property.price} ${'LE'.tr(context)}  / ${property.per!.tr(context)}',
                            style: const TextStyle(
                              fontSize: 12,
                              height: 1.3,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: kLocationColor,
                          size: 17,
                        ),
                        Expanded(
                          child: Text(
                            property.address!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: kLocationColor,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.bed_outlined,
                          color: kLogoColor,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          property.bedrooms.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: kLogoColor,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.photo_size_select_small_outlined,
                          color: kLogoColor,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          property.area.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: kLogoColor,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
