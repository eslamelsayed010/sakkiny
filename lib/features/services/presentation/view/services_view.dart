import 'package:flutter/material.dart';
import 'package:sakkiny/features/services/presentation/view/widget/bloc_bulider/service_bloc_bulider.dart';
import 'package:sakkiny/features/services/presentation/view/widget/custom_search_services.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 10),
          CustomSearchServices(),
          SizedBox(height: 10),
        //  GridViewServices(),
        ServiceBlocBuilder()
        ],
      ),
    );
  }
}
