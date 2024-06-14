import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomOwnerServicesDetails extends StatelessWidget {
  const CustomOwnerServicesDetails({Key? key}) : super(key: key);

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
                'Electrician',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Eslam Elsayed',
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '40\$ for inspection ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kLogoColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: const [
                  Icon(
                    Icons.location_on,
                    color: kLocationColor,
                    size: 15,
                  ),
                  Expanded(
                    child: Text(
                      'Elzagazig',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kLocationColor,
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // const Spacer(),
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
