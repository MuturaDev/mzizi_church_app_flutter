// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_student_detailed_results_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalStudentDetailedResults _$PortalStudentDetailedResultsFromJson(
    Map<String, dynamic> json) {
  return PortalStudentDetailedResults(
      json['id'] as int,
      json['Subjects'] as String,
      json['Score'] as String,
      json['Grade'] as String,
      json['Remark'] as String,
      json['TotalMarks'] as String,
      json['MeanScore'] as String,
      json['MeanGrade'] as String,
      json['StreamPosition'] as String,
      json['OverallPosition'] as String,
      json['Period'] as String,
      json['TermName'] as String,
      json['CurrentYear'] as String,
      json['CTComments'] as String,
      json['HMComments'] as String);
}

Map<String, dynamic> _$PortalStudentDetailedResultsToJson(
        PortalStudentDetailedResults instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Subjects': instance.Subjects,
      'Score': instance.Score,
      'Grade': instance.Grade,
      'Remark': instance.Remark,
      'TotalMarks': instance.TotalMarks,
      'MeanScore': instance.MeanScore,
      'MeanGrade': instance.MeanGrade,
      'StreamPosition': instance.StreamPosition,
      'OverallPosition': instance.OverallPosition,
      'Period': instance.Period,
      'TermName': instance.TermName,
      'CurrentYear': instance.CurrentYear,
      'CTComments': instance.CTComments,
      'HMComments': instance.HMComments
    };
