import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_student_visualization_average_response.g.dart';

@entity
@JsonSerializable()
class PortalStudentVisualizationAverage {

  @PrimaryKey(autoGenerate: true)
  int id;
  String Period;
  String AverageScore;
  String MeanGrade;

  PortalStudentVisualizationAverage(
    this.id,
    this.Period,
    this.AverageScore,
    this.MeanGrade,
  );


  factory PortalStudentVisualizationAverage.fromJson(Map<String,dynamic> json) => _$PortalStudentVisualizationAverageFromJson(json);

  Map<String,dynamic> toJson() => _$PortalStudentVisualizationAverageToJson(this);
  


  @override
  String toString() {
    return 'PortalStudentVisualizationAverage(id: $id, Period: $Period, AverageScore: $AverageScore, MeanGrade: $MeanGrade)';
  }
}
