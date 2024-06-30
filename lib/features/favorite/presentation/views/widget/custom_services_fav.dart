import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/favorite/presentation/views/widget/custom_image_service_fav.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class CustomServicesFav extends StatelessWidget {
  const CustomServicesFav({Key? key, required this.service}) : super(key: key);
  final Service service;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kSelectedServicesView, extra: service);
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
            CustomImageFavService(service: service),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  bottom: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.serviceCategory!.tr(context),
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      '${'Beginning from'.tr(context)} ${service.price} ${'LE'.tr(context)}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: kLogoColor,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: kLocationColor,
                          size: 15,
                        ),
                        Expanded(
                          child: Text(
                            service.address!,
                            style: const TextStyle(
                              fontSize: 10,
                              color: kLocationColor,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
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
