import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

TextEditingController nameController = TextEditingController();
TextEditingController ageController = TextEditingController();
File? selectedImage;

Future<void> pickImage(Function setState) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String fileName = pickedFile.name;
    final File newImage =
        await File(pickedFile.path).copy('${appDir.path}/$fileName');
    setState();
    selectedImage = newImage;
    setState();
  }
}
