import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageTextUploadScreen extends StatefulWidget {
  const ImageTextUploadScreen({super.key});

  @override
  State<ImageTextUploadScreen> createState() => _ImageTextUploadScreenState();
}

class _ImageTextUploadScreenState extends State<ImageTextUploadScreen> {
  File? _selectedImage;
  TextEditingController textEditingController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadData() async {
    if (_selectedImage == null) {
      // No image selected
      return;
    }

    // try {
    //   // Create a Dio instance
    //   Dio dio = Dio();

    //   // Create a FormData object
    //   FormData formData = FormData.fromMap({
    //     'image': await MultipartFile.fromFile(_selectedImage!.path),
    //     'text': _textEditingController.text,
    //   });

    //   // Send the HTTP request
    //   Response response = await dio.post(
    //     'https://example.com/upload', // Replace with your API endpoint
    //     data: formData,
    //   );

    //   // Handle the response
    //   if (response.statusCode == 200) {
    //     // Data uploaded successfully
    //     print('Data uploaded!');
    //   } else {
    //     // Handle the error
    //     print('Data upload failed. Status code: ${response.statusCode}');
    //   }
    // } catch (error) {
    //   // Handle any errors that occurred during the process
    //   print('Error uploading data: $error');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image and Text Upload'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _selectedImage != null
                    ? Image.file(
                        _selectedImage!,
                        height: 200,
                        width: double.infinity, // Ensure it fits the width
                        fit: BoxFit.cover,
                      )
                    : Container(),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                  },
                  child: const Text('Pick Image'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _pickImage(ImageSource.camera);
                  },
                  child: const Text('Take Photo'),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      labelText: 'Text',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _uploadData,
                  child: const Text('Upload Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
