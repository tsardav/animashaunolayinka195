import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/student_model.dart';
import 'package:get/get.dart';

class StudentService {
  final List<Student> _students = [];

  Future<List<Student>> fetchMockStudents() async {
    try {
      final String response = await rootBundle.loadString('assets/mock_students.json');
      final List<dynamic> data = json.decode(response);
      final List<Student> students = data.map((json) => Student.fromJson(json)).toList();
      _students.addAll(students);
      return _students;
    } catch (e) {
      print('Error loading mock data: $e');
      return [];
    }
  }

  Future<List<Student>> fetchStudents() async {
    await Future.delayed(Duration(seconds: 1));
    return _students.isEmpty ? await fetchMockStudents() : _students;
  }

  Future<Student> addStudent(Student student) async {
    await Future.delayed(Duration(seconds: 1));
    _students.add(student);
    return student;
  }

  // Future<void> deleteStudent(String id) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   _students.removeWhere((student) => student.id == id);
  // }

  Future<void> deleteStudent(String id) async {
    await Future.delayed(Duration(seconds: 1));
    _students.removeWhere((student) => student.id == id);
    Get.snackbar(
      'Deleted',
      'Student with id $id deleted successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
