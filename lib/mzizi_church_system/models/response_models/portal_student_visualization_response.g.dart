// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_student_visualization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalStudentVisualization _$PortalStudentVisualizationFromJson(
    Map<String, dynamic> json) {
  return PortalStudentVisualization(json['id'] as int, json['Period'] as String,
      json['UnitName'] as String, json['AverageScore'] as String);
}

Map<String, dynamic> _$PortalStudentVisualizationToJson(
        PortalStudentVisualization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Period': instance.Period,
      'UnitName': instance.UnitName,
      'AverageScore': instance.AverageScore
    };
