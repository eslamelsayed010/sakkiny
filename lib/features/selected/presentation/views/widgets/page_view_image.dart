import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/custom_home_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewImage extends StatefulWidget {
  const PageViewImage({super.key, required this.property});
  final Property property;
  @override
  State<PageViewImage> createState() => _PageViewImageState();
}

class _PageViewImageState extends State<PageViewImage> {
  PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          child: PageView.builder(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => CustomHomeImage(
                image: widget.property.propertyImages![index].secureUrl!),
            itemCount: widget.property.propertyImages!.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SmoothPageIndicator(
            controller: pageController,
            count: 5,
            effect: const ExpandingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: kLogoColor,
              dotWidth: 10,
              dotHeight: 10,
            ),
          ),
        ),
      ],
    );
  }
}
