import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomHomeImage extends StatelessWidget {
  const CustomHomeImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .22,
            width: MediaQuery.of(context).size.width * .8,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: image,
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error),
              ),
            ),
            // child: Image.asset(
            //   AssetsData.getStartD2,
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Text(
                      '2.5',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Material(
                color: Colors.transparent,
                elevation: 5,
                shape: const CircleBorder(),
                child: Container(
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
