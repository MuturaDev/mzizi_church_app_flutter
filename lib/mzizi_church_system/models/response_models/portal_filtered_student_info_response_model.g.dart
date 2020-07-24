// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_filtered_student_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalFilteredStudentInfo _$PortalFilteredStudentInfoFromJson(
    Map<String, dynamic> json) {
  return PortalFilteredStudentInfo(
      json['id'] as int,
      json['Balance'] as String,
      json['BillingBalance'] as String,
      json['PortalAccount'] as String,
      json['PortalPaybill'] as String,
      json['OrganizationID'] as String);
}

Map<String, dynamic> _$PortalFilteredStudentInfoToJson(
        PortalFilteredStudentInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Balance': instance.Balance,
      'BillingBalance': instance.BillingBalance,
      'PortalAccount': instance.PortalAccount,
      'PortalPaybill': instance.PortalPaybill,
      'OrganizationID': instance.OrganizationID
    };
