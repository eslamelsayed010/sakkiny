import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/custom_image_services_search.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class CustomServicesDetailsSearch extends StatelessWidget {
  const CustomServicesDetailsSearch({super.key, required this.service});
  final Service service;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kSelectedServicesView, extra: service);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 10),
        child: SizedBox(
          height: 150,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageSearchServices(
                image: service.images![0].secureUrl!,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.serviceCategory!.tr(context),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      service.description!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${service.price} ${'LE'.tr(context)}',
                            // '${'Beginning from'.tr(context)} ${service.price} ${'LE'.tr(context)}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: kLogoColor,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.favorite_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
