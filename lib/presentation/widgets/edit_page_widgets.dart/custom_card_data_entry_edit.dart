import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:rikaz/core/constants/colors.dart';
import 'package:rikaz/core/constants/functions/data_entry_functions.dart';
import 'package:rikaz/core/helper/sqldb.dart';
import 'package:rikaz/core/widgets/my_button.dart';
import 'package:rikaz/core/widgets/my_card.dart';
import 'package:rikaz/core/widgets/my_text_form_field.dart';
import 'package:rikaz/data/model/student_model.dart';
import 'package:rikaz/presentation/screens/home_page.dart';

class CustomCardDataEntryEdit extends StatefulWidget {
  const CustomCardDataEntryEdit({super.key, required this.student});
  final Student student;
  @override
  State<CustomCardDataEntryEdit> createState() =>
      _CustomCardDataEntryEditState();
}

class _CustomCardDataEntryEditState extends State<CustomCardDataEntryEdit> {
  SqlDb sqlDb = SqlDb();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: MyCard(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text("Insert Data",
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 30),
                MyTextFormField(
                  controller: nameController,
                  label: "Name",
                ),
                const SizedBox(height: 15),
                MyTextFormField(
                  controller: ageController,
                  label: "Age",
                  keyBoard: TextInputType.number,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    pickImage(() {
                      setState(() {});
                    });
                  },
                  child: selectedImage == null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundColor:
                              const Color.fromARGB(53, 158, 158, 158),
                          child: const Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.grey,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            selectedImage!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                const SizedBox(height: 10),
                InkWell(
                    onTap: () {
                      pickImage(() {
                        setState(() {});
                      });
                    },
                    child: Text(
                      "Select Image",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColor.kPrimaryColor),
                    )),
                const SizedBox(height: 30),
                MyButton(
                  text: "Update Data",
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        ageController.text.isEmpty ||
                        selectedImage == null) {
                      Fluttertoast.showToast(
                          msg: "Please Insert All Data",
                          backgroundColor: AppColor.kRedColor);
                    } else if (int.tryParse(ageController.text) == null) {
                      Fluttertoast.showToast(msg: "Insert Number In The Age");
                    } else {
                      Get.offAll(HomePage(index: 2));
                      await sqlDb.updateData('''
                          UPDATE students SET
                          name = '${nameController.text}',
                          age = '${ageController.text}',
                          image = '${selectedImage!.path}'
                          WHERE id = ${widget.student.id}
                           ''');
                      nameController.clear();
                      ageController.clear();
                      setState(() {
                        selectedImage = null;
                      });

                      Fluttertoast.showToast(
                          msg: "Data Updated",
                          backgroundColor: AppColor.kPrimaryColor);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
