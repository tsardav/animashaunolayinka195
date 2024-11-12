import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/student_model.dart';
import '../viewmodels/student_viewmodel.dart';
import 'main_screen.dart';

class AddStudentScreen extends StatelessWidget {
  final StudentViewModel studentViewModel = Get.find();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _enrollmentStatus = 'Enrolled';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the student\'s name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _enrollmentStatus,
                items: ['Enrolled', 'Graduated', 'Alumni']
                    .map((status) => DropdownMenuItem(
                  value: status,
                  child: Text(status),
                ))
                    .toList(),
                onChanged: (value) {
                  _enrollmentStatus = value!;
                },
                decoration: InputDecoration(
                  labelText: 'Enrollment Status',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final newStudent = Student(
                        name: _nameController.text,
                        email: _emailController.text,
                        enrollmentStatus: _enrollmentStatus,
                        profilePhotoUrl: '',
                      );

                      studentViewModel.addStudent(newStudent);

                      Get.snackbar(
                        'Success',
                        'Student added successfully!',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );

                      await Future.delayed(Duration(seconds: 1));

                      Get.find<MainScreenState>().updateSelectedIndex(0);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Add Student', style: TextStyle(
                      color: Colors.white,
                      fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
