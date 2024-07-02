import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomReportImage extends StatefulWidget {
  const CustomReportImage(
      {Key? key, required this.onImageSelected, required this.txt})
      : super(key: key);
  final Function(File) onImageSelected;
  final String txt;

  @override
  State<CustomReportImage> createState() => _CustomReportIdImageState();
}

class _CustomReportIdImageState extends State<CustomReportImage> {
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
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Image.file(
                imageFile!,
                fit: BoxFit.fill,
              ),
            )
          : Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.image_outlined,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    widget.txt,
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
    );
  }
}
