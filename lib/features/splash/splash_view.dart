import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    delayedWidgetAppearance();
    navToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLogoColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(AssetsData.animationS, height: 200),
            const Visibility(
              visible: true, //isVisible,
              child: Text(
                'Sakkiny',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'DancingScript',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void delayedWidgetAppearance() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isVisible = true;
      });
    });
  }

  void navToNext() {
    Future.delayed(
      const Duration(milliseconds: 2700),
      () => GoRouter.of(context).pushReplacement(
          // token != null ?
          AppRouter.kLayoutView
          // : AppRouter.kGetStartView,
          ),
    );
  }
}
