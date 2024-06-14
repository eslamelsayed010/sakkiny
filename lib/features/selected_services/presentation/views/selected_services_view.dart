import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/selected_services_view_body.dart';

class SelectedServicesView extends StatelessWidget {
  const SelectedServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const SelectedServicesViewBody(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FloatingActionButton(
                      heroTag: 'arrow_back_home',
                      backgroundColor: kFloatingColor,
                      mini: true,
                      child: const Icon(
                        Icons.arrow_back,
                        color: kLogoColor,
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      }),
                  const Spacer(),
                  FloatingActionButton(
                      heroTag: 'favorite_outlined',
                      backgroundColor: kFloatingColor,
                      mini: true,
                      child: const Icon(
                        Icons.favorite_outlined,
                        color: kLogoColor,
                      ),
                      onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
