// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prorgress_report_learning_area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningAreas _$LearningAreasFromJson(Map<String, dynamic> json) {
  return LearningAreas(json['LearningArea'] as String,
      json['ScoreDescription'] as String, json['Remarks'] as String);
}

Map<String, dynamic> _$LearningAreasToJson(LearningAreas instance) =>
    <String, dynamic>{
      'LearningArea': instance.LearningArea,
      'ScoreDescription': instance.ScoreDescription,
      'Remarks': instance.Remarks
    };
