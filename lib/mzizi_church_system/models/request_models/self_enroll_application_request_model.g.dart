// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_enroll_application_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalSelfEnrollApplication _$PortalSelfEnrollApplicationFromJson(
    Map<String, dynamic> json) {
  return PortalSelfEnrollApplication(
      json['FormatedDateBooked'] as String,
      json['StartTime'] as String,
      json['Age'] as String,
      json['ChurchServiceID'] as String,
      json['OrganizationID'] as String,
      json['DateBooked'] as String,
      json['StudentID'] as String,
      json['AppCode'] as String);
}

Map<String, dynamic> _$PortalSelfEnrollApplicationToJson(
        PortalSelfEnrollApplication instance) =>
    <String, dynamic>{
      'FormatedDateBooked': instance.FormatedDateBooked,
      'StartTime': instance.StartTime,
      'Age': instance.Age,
      'ChurchServiceID': instance.ChurchServiceID,
      'OrganizationID': instance.OrganizationID,
      'DateBooked': instance.DateBooked,
      'StudentID': instance.StudentID,
      'AppCode': instance.AppCode
    };
