import 'package:flutter/material.dart';
import 'package:sakkiny/core/widgets/custom_fading_widget.dart';

class CustomLoadingIndicatorHomeProducts extends StatelessWidget {
  const CustomLoadingIndicatorHomeProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.favorite_border_outlined),
                        onPressed: () {},
                      )
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

// Container(
// color: Colors.white,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Stack(
// alignment: AlignmentDirectional.bottomStart,
// children: [
// CachedNetworkImage(
// height: 200,
// width: double.infinity,
// imageUrl: product.images![0],
// errorWidget: (context, url, error) => const Center(
// child: Icon(Icons.error),
// ),
// ),
// if (product.discount != 0)
// Container(
// color: Colors.red,
// padding: const EdgeInsets.symmetric(horizontal: 5),
// child: const Text(
// 'DISCOUNT',
// style: TextStyle(
// fontSize: 8,
// color: Colors.white,
// ),
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// ),
// )
// ],
// ),
// Padding(
// padding: const EdgeInsets.all(12),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// product.name!,
// style: const TextStyle(
// fontSize: 14,
// height: 1.3,
// ),
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// ),
// Row(
// children: [
// Text(
// 's${product.price!.round()}\$',
// style: const TextStyle(
// fontSize: 12,
// color: kPrimaryColor,
// ),
// ),
// const SizedBox(width: 5),
// if (product.discount != 0)
// Text(
// 's${product.oldPrice!.round()}\$',
// style: const TextStyle(
// fontSize: 10,
// color: Colors.grey,
// decoration: TextDecoration.lineThrough,
// ),
// ),
// const Spacer(),
// IconButton(
// padding: EdgeInsets.zero,
// icon: const Icon(Icons.favorite_border_outlined),
// onPressed: () {},
// )
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// )
