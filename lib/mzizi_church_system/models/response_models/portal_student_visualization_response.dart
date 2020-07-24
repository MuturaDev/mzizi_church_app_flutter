import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_student_visualization_response.g.dart';

@entity
@JsonSerializable()
class PortalStudentVisualization {

  @PrimaryKey(autoGenerate: true)
  int id;
  String Period;
  String UnitName;
  String AverageScore;

  PortalStudentVisualization(
    this.id,
    this.Period,
    this.UnitName,
    this.AverageScore,
  );

  factory PortalStudentVisualization.fromJson(Map<String, dynamic> json) => _$PortalStudentVisualizationFromJson(json);

  Map<String,dynamic> toJson() => _$PortalStudentVisualizationToJson(this);


  @override
  String toString() {
    return 'PortalStudentVisualization(id: $id, Period: $Period, UnitName: $UnitName, AverageScore: $AverageScore)';
  }
}
