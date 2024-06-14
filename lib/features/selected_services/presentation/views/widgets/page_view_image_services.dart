import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/custom_services_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewImageServices extends StatefulWidget {
  const PageViewImageServices({super.key});

  @override
  State<PageViewImageServices> createState() => _PageViewImageServicesState();
}

class _PageViewImageServicesState extends State<PageViewImageServices> {
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
          height: MediaQuery.of(context).size.height * .4,
          child: PageView.builder(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => const CustomServicesImage(),
            itemCount: 5,
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
