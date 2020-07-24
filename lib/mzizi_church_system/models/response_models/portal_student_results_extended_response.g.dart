// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_student_results_extended_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalStudentResultsExtended _$PortalStudentResultsExtendedFromJson(
    Map<String, dynamic> json) {
  return PortalStudentResultsExtended(
      json['id'] as int,
      json['ExamPeriod'] as String,
      json['AvgScore'] as String,
      json['MeanGrade'] as String,
      json['ExamRemarks'] as String,
      json['DownloadLink'] as String,
      json['FileURL'] as String);
}

Map<String, dynamic> _$PortalStudentResultsExtendedToJson(
        PortalStudentResultsExtended instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ExamPeriod': instance.ExamPeriod,
      'AvgScore': instance.AvgScore,
      'MeanGrade': instance.MeanGrade,
      'ExamRemarks': instance.ExamRemarks,
      'DownloadLink': instance.DownloadLink,
      'FileURL': instance.FileURL
    };
