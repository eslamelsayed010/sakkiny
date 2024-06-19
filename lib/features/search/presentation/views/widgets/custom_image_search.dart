import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomImageSearch extends StatelessWidget {
  const CustomImageSearch({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            height: 250,
            width: double.infinity,
            imageUrl: image,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 8),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     color: Colors.grey[300],
              //   ),
              //   child: Row(
              //     children: const [
              //       Icon(
              //         Icons.star,
              //         color: Colors.amber,
              //         size: 20,
              //       ),
              //       Text(
              //         '4.5',
              //         style: TextStyle(
              //           fontSize: 15,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const Spacer(),
              Material(
                elevation: 20,
                shape: const CircleBorder(),
                child: Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.favorite_outlined,
                      color: kLogoColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
