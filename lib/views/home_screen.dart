import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/student_viewmodel.dart';
import '../widgets/student_card.dart';

class HomeScreen extends StatelessWidget {
  final StudentViewModel studentViewModel = Get.put(StudentViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Profiles')),
      body: Obx(() => ListView.builder(
        itemCount: studentViewModel.students.length,
        itemBuilder: (context, index) {
          return StudentCard(student: studentViewModel.students[index]);
        },
      )),
    );
  }
}
