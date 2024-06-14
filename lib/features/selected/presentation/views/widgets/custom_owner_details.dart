import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

class CustomOwnerDetails extends StatelessWidget {
  const CustomOwnerDetails({Key? key, required this.property})
      : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(AssetsData.loma3),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Eslam Elsayed',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Owner',
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'LE ${property.price!} / ${property.per}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kLogoColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Row(
        //   children: [
        //     FloatingActionButton(
        //       heroTag: 'message_rounded_owner',
        //       backgroundColor: Colors.grey[300],
        //       mini: true,
        //       child: const Icon(
        //         Icons.message_rounded,
        //         color: kLogoColor,
        //       ),
        //       onPressed: () {},
        //     ),
        //     const SizedBox(width: 10),
        //     FloatingActionButton(
        //       heroTag: 'phone_owner',
        //       backgroundColor: Colors.grey[300],
        //       mini: true,
        //       child: const Icon(
        //         Icons.phone,
        //         color: kLogoColor,
        //       ),
        //       onPressed: () {},
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
