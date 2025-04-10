import 'package:flutter/material.dart';
import 'package:rikaz/presentation/screens/display_data.dart';
import 'package:rikaz/presentation/screens/edit_data.dart';
import 'package:rikaz/presentation/screens/home_page.dart';
import 'package:rikaz/presentation/screens/splash.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomePage.id: (context) => HomePage(index: 1),
  EditData.id: (context) => EditData(),
  Splash.id: (context) => Splash(),
  DisplayData.id: (context) => DisplayData(),
};
