import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz/business_logic/cubit/data_cubit.dart';
import 'package:rikaz/core/constants/colors.dart';
import 'package:rikaz/core/helper/sqldb.dart';
import 'package:rikaz/core/widgets/my_indicator.dart';
import 'package:rikaz/presentation/widgets/display_page_widgets.dart/custom_card_student.dart';

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
            return CustomCardStudent();
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
