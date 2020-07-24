// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_siblings_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalSiblings _$PortalSiblingsFromJson(Map<String, dynamic> json) {
  return PortalSiblings(
      json['id'] as int,
      json['StudentID'] as String,
      json['RegistrationNumber'] as String,
      json['StudentFullName'] as String,
      json['CourseName'] as String,
      json['StudentStatus'] as String);
}

Map<String, dynamic> _$PortalSiblingsToJson(PortalSiblings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'StudentID': instance.StudentID,
      'RegistrationNumber': instance.RegistrationNumber,
      'StudentFullName': instance.StudentFullName,
      'CourseName': instance.CourseName,
      'StudentStatus': instance.StudentStatus
    };
