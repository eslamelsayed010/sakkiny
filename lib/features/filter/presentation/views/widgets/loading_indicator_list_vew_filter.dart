import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/filter/presentation/views/widgets/loading_indicator_filter.dart';

class LoadingIndicatorListViewFilter extends StatelessWidget {
  const LoadingIndicatorListViewFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                      heroTag: 'arrow_back_home',
                      backgroundColor: Colors.white,
                      mini: true,
                      child: const Icon(
                        Icons.arrow_back,
                        color: kLogoColor,
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    const Spacer(),
                    const Center(
                      child: Text(
                        'Result',
                        style: TextStyle(
                          color: kLogoColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => const LoadingIndicatorFilter(),
                separatorBuilder: (context, index) => const CustomDivider(),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
