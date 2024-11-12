import 'package:flutter/material.dart';
import 'views/main_screen.dart';
import 'package:get/get.dart';

void main() {
  Get.put(MainScreenState());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}


