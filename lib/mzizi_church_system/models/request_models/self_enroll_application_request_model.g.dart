// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_enroll_application_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalSelfEnrollApplication _$PortalSelfEnrollApplicationFromJson(
    Map<String, dynamic> json) {
  return PortalSelfEnrollApplication(
      json['Firstname'] as String,
      json['Lastname'] as String,
      json['PhoneNumber'] as String,
      json['EmailAddress'] as String,
      json['Age'] as String,
      json['ChurchServiceID'] as String,
      json['OrganizationID'] as String,
      json['DateBooked'] as String,
      json['AppCode'] as String);
}

Map<String, dynamic> _$PortalSelfEnrollApplicationToJson(
        PortalSelfEnrollApplication instance) =>
    <String, dynamic>{
      'Firstname': instance.Firstname,
      'Lastname': instance.Lastname,
      'PhoneNumber': instance.PhoneNumber,
      'EmailAddress': instance.EmailAddress,
      'Age': instance.Age,
      'ChurchServiceID': instance.ChurchServiceID,
      'OrganizationID': instance.OrganizationID,
      'DateBooked': instance.DateBooked,
      'AppCode': instance.AppCode
    };
