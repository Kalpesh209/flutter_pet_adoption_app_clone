import 'package:flutter/material.dart';
import 'package:flutter_pet_adoption_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_pet_adoption_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_pet_adoption_app_clone/Presentation/Screens/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: BottomNavigationBarScreen(),
    );
  }
}
