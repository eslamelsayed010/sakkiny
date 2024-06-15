import 'package:flutter/material.dart';
import 'package:sakkiny/features/home/presentation/views/widget/loading_indicator/home_loading_indicator.dart';

class ListViewHomeLoadingIndicator extends StatelessWidget {
  const ListViewHomeLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const CustomLoadingIndicatorHome(),
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: 10,
      ),
    );
  }
}
