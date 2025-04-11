import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rikaz/core/constants/colors.dart';
import 'package:rikaz/core/constants/functions/data_entry_functions.dart';
import 'package:rikaz/data/model/student_model.dart';
import 'package:rikaz/presentation/widgets/edit_page_widgets.dart/custom_card_data_entry_edit.dart';

class EditData extends StatefulWidget {
  const EditData({super.key});
  static String id = "editData";
  @override
  State<EditData> createState() => _InsertDataState();
}

class _InsertDataState extends State<EditData> {
  late Student student;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    student = ModalRoute.of(context)!.settings.arguments as Student;
    nameController.text = student.name;
    ageController.text = student.age.toString();
    selectedImage = File(student.image);
  }

  @override
  void dispose() async {
    nameController.clear();
    ageController.clear();
    selectedImage = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.kWhiteColor,
        backgroundColor: AppColor.kPrimaryColor,
        title: Text("Edit Data"),
      ),
      backgroundColor: AppColor.kWhiteColor,
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: CustomCardDataEntryEdit(student: student)),
    );
  }
}
