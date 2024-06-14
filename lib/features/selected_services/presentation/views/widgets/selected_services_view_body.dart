import 'package:flutter/material.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/custom_services_details.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/page_view_image_services.dart';

class SelectedServicesViewBody extends StatelessWidget {
  const SelectedServicesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PageViewImageServices(),
          SizedBox(height: 30),
          CustomServicesDetails(),
        ],
      ),
    );
  }
}
