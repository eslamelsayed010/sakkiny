// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakkiny/core/utils/assets.dart';

class CustomProfileImage extends StatefulWidget {
  const CustomProfileImage(
      {super.key, required this.onImageSelected, required this.image});
  final Function(File) onImageSelected;
  final String image;

  @override
  State<CustomProfileImage> createState() => _CustomProfileImageState();
}

class _CustomProfileImageState extends State<CustomProfileImage> {
  File? imageFile;
  void pickImage() async {
    XFile? resultList;
    try {
      resultList = await ImagePicker().pickImage(source: ImageSource.gallery);
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
                radius: 80,
                backgroundImage: FileImage(imageFile!),
              )
            : CircleAvatar(
                radius: 80,
                backgroundImage: widget.image != null
                    ? NetworkImage(widget.image)
                    : const NetworkImage(AssetsData.user),
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
