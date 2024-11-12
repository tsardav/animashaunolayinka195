import 'package:get/get.dart';
import '../models/student_model.dart';
import '../services/student_service.dart';

class StudentViewModel extends GetxController {
  var students = <Student>[].obs;
  final StudentService _studentService = StudentService();

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  // Fetch students from the service
  void fetchStudents() async {
    try {
      students.value = await _studentService.fetchStudents();
    } catch (e) {
      print('Error fetching students: $e');
    }
  }

  // Add a new student
  void addStudent(Student student) async {
    try {
      await _studentService.addStudent(student);
      students.add(student); // Update the local list
    } catch (e) {
      print('Error adding student: $e');
    }
  }

  // Delete a student by ID
  // void deleteStudent(String id) async {
  //   try {
  //     await _studentService.deleteStudent(id);
  //     students.removeWhere((student) => student.id == id); // Trigger update for `students`
  //   } catch (e) {
  //     print('Error deleting student: $e');
  //   }
  // }

  void deleteStudent(String id) async {
    try {
      await _studentService.deleteStudent(id);
      students.value = students.where((student) => student.id != id).toList();
    } catch (e) {
      print('Error deleting student: $e');
    }
  }
}
