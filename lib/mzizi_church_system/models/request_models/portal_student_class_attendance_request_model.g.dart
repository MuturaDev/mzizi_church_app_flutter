// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_student_class_attendance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalStudentClassRequest _$PortalStudentClassRequestFromJson(
    Map<String, dynamic> json) {
  return PortalStudentClassRequest(
      json['StudentID'] as String,
      json['YearID'] as String,
      json['TermID'] as String,
      json['OrganizationID'] as String,
      json['AppCode'] as String);
}

Map<String, dynamic> _$PortalStudentClassRequestToJson(
        PortalStudentClassRequest instance) =>
    <String, dynamic>{
      'StudentID': instance.StudentID,
      'YearID': instance.YearID,
      'TermID': instance.TermID,
      'OrganizationID': instance.OrganizationID,
      'AppCode': instance.AppCode
    };
