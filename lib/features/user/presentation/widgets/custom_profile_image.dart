import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakkiny/core/utils/assets.dart';

class CustomProfileImage extends StatefulWidget {
  const CustomProfileImage({super.key});

  @override
  State<CustomProfileImage> createState() => _CustomProfileImageState();
}

class _CustomProfileImageState extends State<CustomProfileImage> {
  File? imageFile;

  Future<void> selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
      }
    });
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
            : const CircleAvatar(
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
                selectImage();
              }),
        ),
      ],
    );
  }
}
