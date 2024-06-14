import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/custom_image_services_search.dart';

class CustomServicesDetailsSearch extends StatelessWidget {
  const CustomServicesDetailsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSelectedServicesView);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 10),
        child: SizedBox(
          height: 150,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomImageSearchServices(),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Electrical maintenance services',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'For Technician conducts an inspection to determine the maintenance process and cost',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Expanded(
                      child: Row(
                        children: [
                          const Text(
                            '100 LE',
                            style: TextStyle(
                              fontSize: 15,
                              color: kLogoColor,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                          const Spacer(),
                          IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.favorite_outlined,
                              color: kLogoColor,
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
