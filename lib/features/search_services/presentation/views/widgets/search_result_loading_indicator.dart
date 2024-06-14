// import 'package:flutter/material.dart';
// import 'package:lomaTV/features/home/presentation/views/widget/loading_indicator/custom_movie_image_loading_indicator.dart';
// import '../../../../../core/widgets/custom_fading_widget.dart';
//
// class SearchItemLoadingIndicator extends StatelessWidget {
//   const SearchItemLoadingIndicator({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomFadingWidget(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 30),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 150,
//               child: CustomMovieImageLoadingIndicator(),
//             ),
//             const SizedBox(
//               width: 30,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * .5,
//                     child: Container(
//                       height: 25,
//                       width: 200,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 6,
//                   ),
//                   Container(
//                     height: 20,
//                     width: 100,
//                     color: Colors.grey,
//                   ),
//                   const SizedBox(
//                     height: 6,
//                   ),
//                   Container(
//                     height: 25,
//                     width: 70 + 60,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
