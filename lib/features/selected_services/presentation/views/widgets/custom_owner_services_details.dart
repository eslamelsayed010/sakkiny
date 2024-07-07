import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class CustomOwnerServicesDetails extends StatelessWidget {
  const CustomOwnerServicesDetails({Key? key, required this.service})
      : super(key: key);
  final Service service;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
             CircleAvatar(
              radius: 25,
              backgroundImage:  NetworkImage(service.userId!.profilePicture!.secureUrl!),
            ),
            const Positioned(
              bottom: 2.5,
              right: 2.5,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              bottom: 3,
              right: 3,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: _getStatusColor(service.userId?.status),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service.serviceCategory!.tr(context),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    service.userId?.name ?? '',
                    style: const TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${'Beginning from'.tr(context)} ${service.price} ${'LE'.tr(context)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kLogoColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: kLocationColor,
                    size: 15,
                  ),
                  Expanded(
                    child: Text(
                      service.address ?? 'No address',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kLocationColor,
                        fontSize: 10,
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
      ],
    );
  }

  Color _getStatusColor(String? status) {
    if (status == 'online') {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
