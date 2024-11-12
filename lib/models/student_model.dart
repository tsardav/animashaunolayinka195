import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'student_model.g.dart';

@JsonSerializable()
class Student {
  final String id;
  final String name;
  final String email;
  final String enrollmentStatus;
  final String profilePhotoUrl;

  Student({
    String? id, // Make the ID optional
    required this.name,
    required this.email,
    required this.enrollmentStatus,
    required this.profilePhotoUrl,
  }) : id = id ?? Uuid().v4(); // Generate a unique ID if not provided

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
