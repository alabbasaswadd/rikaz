import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rikaz/core/constants/images.dart';
import 'package:rikaz/presentation/screens/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static String id = "splash";
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(HomePage.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImage.rikaz),
      ),
    );
  }
}
