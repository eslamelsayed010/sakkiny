// ignore_for_file: unused_local_variable

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class Name {
  static Future<List<XFile>> pick1Images() async {
    List<XFile>? selectedImages = [];
    List<XFile>? resultList = [];
    try {
      resultList = await ImagePicker().pickMultiImage();
      return resultList;
    } catch (e) {
      debugPrint(e.toString());
    }
    if (resultList != null) {
      selectedImages = resultList;
    }
    return [];
  }
}
