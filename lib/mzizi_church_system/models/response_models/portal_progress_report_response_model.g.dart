// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_progress_report_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalProgressReport _$PortalProgressReportFromJson(Map<String, dynamic> json) {
  return PortalProgressReport(
      json['id'] as int,
      json['StudentFullName'] as String,
      json['YearID'] as String,
      json['TermName'] as String,
      json['ExamTypeDesc'] as String,
      json['CourseName'] as String,
      json['LevelName'] as String,
      json['Activity'] as String,
      json['LearningArea'] as String,
      json['Remarks'] as String,
      json['ScoreDescription'] as String,
      json['ClassTeacherComment'] as String,
      json['HeadTeacherComment'] as String);
}

Map<String, dynamic> _$PortalProgressReportToJson(
        PortalProgressReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'StudentFullName': instance.StudentFullName,
      'YearID': instance.YearID,
      'TermName': instance.TermName,
      'ExamTypeDesc': instance.ExamTypeDesc,
      'CourseName': instance.CourseName,
      'LevelName': instance.LevelName,
      'Activity': instance.Activity,
      'LearningArea': instance.LearningArea,
      'Remarks': instance.Remarks,
      'ScoreDescription': instance.ScoreDescription,
      'ClassTeacherComment': instance.ClassTeacherComment,
      'HeadTeacherComment': instance.HeadTeacherComment
    };
