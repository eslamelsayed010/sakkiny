import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomServiceImage extends StatefulWidget {
  final Function(List<XFile>) onImagesSelected;

  const CustomServiceImage({Key? key, required this.onImagesSelected}) : super(key: key);

  @override
  State<CustomServiceImage> createState() => _CustomServiceImageState();
}

class _CustomServiceImageState extends State<CustomServiceImage> {
  List<XFile> selectedImages = [];

  void pickImages() async {
    List<XFile>? resultList = [];
    try {
      resultList = await ImagePicker().pickMultiImage();
    } catch (e) {
      debugPrint(e.toString());
    }
    if (resultList != null) {
      setState(() {
        selectedImages = resultList!;
      });
      widget.onImagesSelected(selectedImages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickImages,
      child: selectedImages.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CarouselSlider(
                items: selectedImages.map(
                  (image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Image.file(
                            File(image.path),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1.0,
                  height: 300,
                ),
              ),
            )
          : Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.image_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Add Photo',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
    );
  }
}

// import 'dart:io';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class CustomServiceImage extends StatefulWidget {
//   final Function(List<XFile>) onImagesSelected;
//
//   const CustomServiceImage({Key? key, required this.onImagesSelected})
//       : super(key: key);
//
//   @override
//   State<CustomServiceImage> createState() => _CustomServiceImageState();
// }
//
// class _CustomServiceImageState extends State<CustomServiceImage> {
//   List<XFile> selectedImages = [];
//
//   void pickImages() async {
//     List<XFile>? resultList = [];
//     try {
//       resultList = await ImagePicker().pickMultiImage();
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     if (resultList != null) {
//       setState(() {
//         selectedImages = resultList!;
//       });
//       widget
//           .onImagesSelected(selectedImages.map((image) => File(image.path)).toList());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: pickImages,
//       child: selectedImages.isNotEmpty
//           ? ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: CarouselSlider(
//                 items: selectedImages.map(
//                   (image) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Container(
//                           width: MediaQuery.of(context).size.width,
//                           margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                           decoration: const BoxDecoration(
//                             color: Colors.grey,
//                           ),
//                           child: Image.file(
//                             File(image.path),
//                             fit: BoxFit.cover,
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ).toList(),
//                 options: CarouselOptions(
//                   initialPage: 0,
//                   enableInfiniteScroll: true,
//                   reverse: false,
//                   autoPlay: true,
//                   autoPlayInterval: const Duration(seconds: 4),
//                   autoPlayAnimationDuration: const Duration(seconds: 1),
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   scrollDirection: Axis.horizontal,
//                   viewportFraction: 1.0,
//                   height: 200,
//                 ),
//               ),
//             )
//           : Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.black),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: const [
//                   Icon(
//                     Icons.image_outlined,
//                     color: Colors.black,
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     'Add Photo',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
