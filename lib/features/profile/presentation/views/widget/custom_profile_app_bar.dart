import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

AppBar buildAppBar(BuildContext context, text) {
  return AppBar(
    // leading: Row(
    //   children: [
    //     const SizedBox(width: 10),
    //     Material(
    //       color: Colors.transparent,
    //       elevation: 5,
    //       shape: const CircleBorder(),
    //       child: Container(
    //         decoration: const BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: Color(0xff494668),
    //         ),
    //         child: IconButton(
    //           padding: EdgeInsets.zero,
    //           icon: const Icon(
    //             Icons.arrow_back,
    //             color: Colors.white,
    //           ),
    //           onPressed: () {
    //             GoRouter.of(context).pop();
    //           },
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    backgroundColor: kLogoColor,
    title: Text(text),
    centerTitle: true,
  );
}
