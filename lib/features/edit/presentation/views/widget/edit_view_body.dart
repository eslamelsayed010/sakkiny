import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/edit/presentation/views/widget/custom_edit.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Your Property'),
          centerTitle: true,
          backgroundColor: kLogoColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                itemBuilder: (context, index) => const CustomEdit(),
                separatorBuilder: (context, index) => const CustomDivider(),
                itemCount: 1,
              ),
            ),
          ],
        ));
  }
}
