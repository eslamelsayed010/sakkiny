import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomCameraImage extends StatefulWidget {
  const CustomCameraImage({super.key, required this.onImageSelected});
  final Function(File) onImageSelected;

  @override
  State<CustomCameraImage> createState() => _CustomCameraImageState();
}

class _CustomCameraImageState extends State<CustomCameraImage> {
  File? imageFile;
  void pickImage() async {
    XFile? resultList;
    try {
      resultList = await ImagePicker().pickImage(source: ImageSource.camera);
    } catch (e) {
      debugPrint(e.toString());
    }
    if (resultList != null) {
      setState(() {
        imageFile = File(resultList!.path);
      });
      widget.onImageSelected(imageFile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        imageFile != null
            ? CircleAvatar(
                backgroundColor: kLogoColor,
                radius: 80,
                backgroundImage: FileImage(imageFile!),
              )
            : const CircleAvatar(
                backgroundColor: kLogoColor,
                radius: 80,
                backgroundImage: AssetImage(AssetsData.user),
              ),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.black,
          child: IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                pickImage();
              }),
        ),
      ],
    );
  }
}
