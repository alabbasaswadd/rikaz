import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:rikaz/business_logic/cubit/game_cubit.dart';
import 'package:rikaz/presentation/screens/splash.dart';
import 'package:rikaz/routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GameCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: Splash.id,
      ),
    );
  }
}
