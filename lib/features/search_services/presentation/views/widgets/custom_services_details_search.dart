import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/custom_image_services_search.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

// class CustomServicesDetailsSearch extends StatelessWidget {
//   const CustomServicesDetailsSearch({super.key, required this.service});
//   final Service service;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         GoRouter.of(context).push(AppRouter.kSelectedServicesView);
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20.0, right: 10),
//         child: SizedBox(
//           height: 150,
//           width: double.infinity,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                CustomImageSearchServices(image:  service.images![0].secureUrl!,),
//               const SizedBox(width: 15),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                      Text(
//                       service.serviceCategory!,
//                       style:const TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 10),
//                      Text(
//                       service.description!,
//                       style:const TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey,
//                       ),
//                       maxLines: 4,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const Spacer(),
//                     Expanded(
//                       child: Row(
//                         children: [
//                            Text(
//                             '${service.price}/ LE',
//                             style:const TextStyle(
//                               fontSize: 15,
//                               color: kLogoColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             maxLines: 1,
//                           ),
//                           const Spacer(),
//                           IconButton(
//                             padding: EdgeInsets.zero,
//                             icon: const Icon(
//                               Icons.favorite_outlined,
//                               color: kLogoColor,
//                             ),
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomServicesDetailsSearch extends StatelessWidget {
  const CustomServicesDetailsSearch({super.key, required this.service});
  final Service service;

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
              service.images != null && service.images!.isNotEmpty
                  ? CustomImageSearchServices(
                      image: service.images![0].secureUrl!)
                  : Container(), // Show an empty container or a placeholder if there are no images
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.serviceCategory ??
                          '', // Provide a fallback in case serviceCategory is null
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      service.description ??
                          '', // Provide a fallback in case description is null
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          '${service.price ?? 0}/ LE', // Provide a fallback in case price is null
                          style: const TextStyle(
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
