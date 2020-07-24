// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_student_visualization_average_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalStudentVisualizationAverage _$PortalStudentVisualizationAverageFromJson(
    Map<String, dynamic> json) {
  return PortalStudentVisualizationAverage(
      json['id'] as int,
      json['Period'] as String,
      json['AverageScore'] as String,
      json['MeanGrade'] as String);
}

Map<String, dynamic> _$PortalStudentVisualizationAverageToJson(
        PortalStudentVisualizationAverage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Period': instance.Period,
      'AverageScore': instance.AverageScore,
      'MeanGrade': instance.MeanGrade
    };
