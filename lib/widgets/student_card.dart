import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/student_model.dart';
import '../viewmodels/student_viewmodel.dart';

class StudentCard extends StatelessWidget {
  final Student student;
  final StudentViewModel studentViewModel = Get.find();

  StudentCard({required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: student.profilePhotoUrl.isNotEmpty
              ? NetworkImage(student.profilePhotoUrl)
              : AssetImage('assets/default_profile.png') as ImageProvider,
        ),
        title: Text(student.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(student.email),
            Text(student.enrollmentStatus),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            studentViewModel.deleteStudent(student.id);          },
        ),
      ),
    );
  }
}
