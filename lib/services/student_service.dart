import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/student_model.dart';
import 'package:get/get.dart';

class StudentService {
  final List<Student> _students = []; // Mock "database" to keep track of students in memory

  // Load initial mock data from a local JSON file
  Future<List<Student>> fetchMockStudents() async {
    try {
      final String response = await rootBundle.loadString('assets/mock_students.json');
      final List<dynamic> data = json.decode(response);
      final List<Student> students = data.map((json) => Student.fromJson(json)).toList();
      _students.addAll(students); // Load data into the mock "database"
      return _students;
    } catch (e) {
      print('Error loading mock data: $e');
      return [];
    }
  }

  // Fetch students (from memory if already loaded)
  Future<List<Student>> fetchStudents() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return _students.isEmpty ? await fetchMockStudents() : _students;
  }

  // Add a new student to the mock "database"
  Future<Student> addStudent(Student student) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    _students.add(student); // Add student to in-memory list
    return student;
  }

  // Delete a student by unique ID
  // Future<void> deleteStudent(String id) async {
  //   await Future.delayed(Duration(seconds: 1)); // Simulate network delay
  //   _students.removeWhere((student) => student.id == id); // Delete from in-memory list
  // }

  Future<void> deleteStudent(String id) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay

    // Remove from in-memory list
    _students.removeWhere((student) => student.id == id);

    // Optionally add a snackbar to confirm deletion
    Get.snackbar(
      'Deleted',
      'Student with id $id deleted successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
