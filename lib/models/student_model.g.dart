// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      name: json['name'] as String,
      email: json['email'] as String,
      enrollmentStatus: json['enrollmentStatus'] as String,
      profilePhotoUrl: json['profilePhotoUrl'] as String,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'enrollmentStatus': instance.enrollmentStatus,
      'profilePhotoUrl': instance.profilePhotoUrl,
    };
