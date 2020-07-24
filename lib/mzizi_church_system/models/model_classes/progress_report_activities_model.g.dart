// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_report_activities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activities _$ActivitiesFromJson(Map<String, dynamic> json) {
  return Activities(
      json['Activity'] as String,
      json['CourseName'] as String,
      json['LevelName'] as String,
      (json['learningAreaList'] as List)
          ?.map((e) => e == null
              ? null
              : LearningAreas.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ActivitiesToJson(Activities instance) =>
    <String, dynamic>{
      'Activity': instance.Activity,
      'CourseName': instance.CourseName,
      'LevelName': instance.LevelName,
      'learningAreaList': instance.learningAreaList
    };
