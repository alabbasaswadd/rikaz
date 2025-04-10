import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rikaz/business_logic/cubit/data_cubit.dart';
import 'package:rikaz/core/constants/colors.dart';
import 'package:rikaz/core/helper/sqldb.dart';
import 'package:rikaz/core/widgets/my_card.dart';
import 'package:rikaz/core/widgets/my_indicator.dart';
import 'package:rikaz/presentation/screens/edit_data.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key});
  static String id = "displayData";
  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  int? selectedStudentId;
  SqlDb sqlDb = SqlDb();

  @override
  void initState() {
    super.initState();
    context.read<DataCubit>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      body: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: MyIndicator());
          } else if (state is DataLoaded) {
            var students = state.students;
            if (students.isEmpty) {
              return Center(child: Text("No Student"));
            }
            return GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: students.length,
              itemBuilder: (context, index) {
                var student = students[index];
                return InkWell(
                  onLongPress: () {
                    setState(() {
                      selectedStudentId = student.id;
                    });
                  },
                  onTap: () {
                    Get.toNamed(EditData.id, arguments: student);
                  },
                  child: Stack(
                    children: [
                      MyCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.file(
                                File(student.image),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.broken_image),
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Name: ${student.name}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Age: ${student.age}"),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                      if (selectedStudentId == student.id)
                        Positioned(
                          top: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () async {
                              await sqlDb.deleteData(
                                  'DELETE FROM students WHERE id = ${student.id}');
                              context.read<DataCubit>().getData();
                              setState(() {
                                selectedStudentId = null;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 18,
                              child: Icon(Icons.delete,
                                  color: AppColor.kWhiteColor),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
