import 'package:flutter/material.dart';
import 'package:rikaz/core/constants/colors.dart';
import 'package:rikaz/presentation/screens/display_data.dart';
import 'package:rikaz/presentation/screens/game_page.dart';
import 'package:rikaz/presentation/screens/insert_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.index});
  static String id = "homePage";
  final int index;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  int refreshKey = 0;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 3, initialIndex: widget.index, vsync: this);

    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        setState(() {
          refreshKey++; 
        });
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget buildTabContent(Widget child, String id) {
    return KeyedSubtree(
      key: ValueKey('$id-$refreshKey'),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.kWhiteColor,
        backgroundColor: AppColor.kPrimaryColor,
        title: Text("Rikaz"),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: AppColor.kPrimaryColor,
          labelColor: AppColor.kWhiteColor,
          unselectedLabelColor: AppColor.kSecondColor,
          tabs: const [
            Tab(text: "Game"),
            Tab(text: "Insert Data"),
            Tab(text: "Display Data"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          buildTabContent(GameScreen(), "game"),
          buildTabContent(const InsertData(), "insert"),
          buildTabContent(const DisplayData(), "display"),
        ],
      ),
    );
  }
}
