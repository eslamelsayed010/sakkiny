import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomVerifyIdImage extends StatefulWidget {
  const CustomVerifyIdImage(
      {Key? key, required this.onImageSelected, required this.txt})
      : super(key: key);
  final Function(File) onImageSelected;
  final String txt;

  @override
  State<CustomVerifyIdImage> createState() => _CustomVerifyIdImageState();
}

class _CustomVerifyIdImageState extends State<CustomVerifyIdImage> {
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
    return InkWell(
      onTap: () {
        pickImage();
      },
      child: imageFile != null
          ? Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Image.file(
                imageFile!,
                fit: BoxFit.cover,
              ),
            )
          : Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.image_outlined,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.txt,
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
