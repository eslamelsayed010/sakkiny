import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/add/presentation/views/widget/add_service_view_body.dart';

class AddServiceView extends StatelessWidget {
  const AddServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              backgroundColor: Colors.grey[300],
              mini: true,
              child: const Icon(
                Icons.arrow_back,
                color: kLogoColor,
              ),
            )
          ],
        ),
      ),
      body: const AddServiceViewBody(),
    );
  }
}
