import 'package:flutter/material.dart';
import 'package:rikaz/core/constants/colors.dart';
import 'package:rikaz/core/helper/sqldb.dart';
import 'package:rikaz/presentation/widgets/insert_page_widgets/custom_card_dataentry_insert_page.dart';

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  SqlDb sqlDb = SqlDb();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: CustomCardDataentryInsertPage()),
    );
  }
}
