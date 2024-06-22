import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class CustomServices extends StatelessWidget {
  const CustomServices({Key? key, required this.service}) : super(key: key);
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
            CachedNetworkImage(
              // fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
              imageUrl: service.images![0].secureUrl!,

              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.serviceCategory ?? 'No category',
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Beginning from 100LE',
                          style: TextStyle(
                            fontSize: 10,
                            color: kLogoColor,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.favorite_outlined,
                          color: kLogoColor,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: kLogoColor,
                        size: 15,
                      ),
                      Text(
                        service.address ?? 'No address',
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
          ],
        ),
      ),
    );
  }
}
