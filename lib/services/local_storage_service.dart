import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/student_model.dart';

class LocalStorageService {
  static const String _studentKey = 'student_profiles';

  Future<List<Student>> getStudents() async {
    final prefs = await SharedPreferences.getInstance();
    final studentListJson = prefs.getStringList(_studentKey) ?? [];
    return studentListJson.map((e) => Student.fromJson(json.decode(e))).toList();
  }

  Future<void> saveStudent(Student student) async {
    final prefs = await SharedPreferences.getInstance();
    final students = await getStudents();
    students.add(student);
    prefs.setStringList(_studentKey, students.map((e) => json.encode(e.toJson())).toList());
  }

  Future<void> deleteStudent(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final students = await getStudents();
    students.removeWhere((student) => student.id == id);
    prefs.setStringList(_studentKey, students.map((e) => json.encode(e.toJson())).toList());
  }
}
