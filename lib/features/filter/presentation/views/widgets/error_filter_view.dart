import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';

class ErrorFilterView extends StatelessWidget {
  const ErrorFilterView({Key? key, required this.error}) : super(key: key);
  final String error;
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
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .3),
                  CustomErrorWidget(errorMassage: error),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
