// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_student_class_attendance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalStudentClassAttendance _$PortalStudentClassAttendanceFromJson(
    Map<String, dynamic> json) {
  return PortalStudentClassAttendance(
      json['id'] as int,
      json['StudentName'] as String,
      json['Status'] as String,
      json['CourseName'] as String,
      json['Remarks'] as String,
      json['DateRecorded'] as String,
      json['TermFor'] as String,
      json['YearFor'] as String,
      json['UnitName'] as String,
      json['RollcallSessionName'] as String);
}

Map<String, dynamic> _$PortalStudentClassAttendanceToJson(
        PortalStudentClassAttendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'StudentName': instance.StudentName,
      'Status': instance.Status,
      'CourseName': instance.CourseName,
      'Remarks': instance.Remarks,
      'DateRecorded': instance.DateRecorded,
      'TermFor': instance.TermFor,
      'YearFor': instance.YearFor,
      'UnitName': instance.UnitName,
      'RollcallSessionName': instance.RollcallSessionName
    };
