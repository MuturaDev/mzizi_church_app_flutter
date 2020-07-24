// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(json['StudentID'] as String, json['AppCode'] as String);
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'StudentID': instance.StudentID,
      'AppCode': instance.AppCode
    };
