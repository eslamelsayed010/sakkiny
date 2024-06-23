import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';

class NoResultSearch extends StatelessWidget {
  const NoResultSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Search For Show Property'.tr(context),
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
