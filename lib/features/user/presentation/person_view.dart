import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/user/presentation/widgets/person_view_body.dart';

class PersonView extends StatelessWidget {
  const PersonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.close)),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Update'.tr(context),
              style: const TextStyle(
                color: kLogoColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: const PersonViewBody(),
    );
  }
}
