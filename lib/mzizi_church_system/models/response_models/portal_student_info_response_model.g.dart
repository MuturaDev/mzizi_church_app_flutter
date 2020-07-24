// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_student_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalStudentInfo _$PortalStudentInfoFromJson(Map<String, dynamic> json) {
  return PortalStudentInfo(
      json['id'] as int,
      json['StudentFullName'] as String,
      json['RegistrationNumber'] as String,
      json['Email'] as String,
      json['StudentPhoneNo'] as String,
      json['DOB'] as String,
      json['DateOfAdmission'] as String,
      json['TwoNames'] as String,
      json['Balance'] as String,
      json['MeanGrade'] as String,
      json['MeanScore'] as String,
      json['Attendance'] as String,
      json['Events'] as String,
      json['PhotoUrl'] as String,
      json['CopyrightYear'] as String,
      json['ClassStream'] as String,
      json['SchoolName'] as String,
      json['SchoolMotto'] as String,
      json['BillingBalance'] as String,
      json['PortalAccount'] as String,
      json['PortalPaybill'] as String,
      json['OrganizationID'] as String);
}

Map<String, dynamic> _$PortalStudentInfoToJson(PortalStudentInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'StudentFullName': instance.StudentFullName,
      'RegistrationNumber': instance.RegistrationNumber,
      'Email': instance.Email,
      'StudentPhoneNo': instance.StudentPhoneNo,
      'DOB': instance.DOB,
      'DateOfAdmission': instance.DateOfAdmission,
      'TwoNames': instance.TwoNames,
      'Balance': instance.Balance,
      'MeanGrade': instance.MeanGrade,
      'MeanScore': instance.MeanScore,
      'Attendance': instance.Attendance,
      'Events': instance.Events,
      'PhotoUrl': instance.PhotoUrl,
      'CopyrightYear': instance.CopyrightYear,
      'ClassStream': instance.ClassStream,
      'SchoolName': instance.SchoolName,
      'SchoolMotto': instance.SchoolMotto,
      'BillingBalance': instance.BillingBalance,
      'PortalAccount': instance.PortalAccount,
      'PortalPaybill': instance.PortalPaybill,
      'OrganizationID': instance.OrganizationID
    };
