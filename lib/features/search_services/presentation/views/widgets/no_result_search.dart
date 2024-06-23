import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';

class NoResultSearchServices extends StatelessWidget {
  const NoResultSearchServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Search For Show Services'.tr(context),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
