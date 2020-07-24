
import 'package:json_annotation/json_annotation.dart';

part 'prorgress_report_learning_area_model.g.dart';

@JsonSerializable()
class LearningAreas{

  String LearningArea;
  String ScoreDescription;
  String Remarks;

  LearningAreas(
    this.LearningArea,
    this.ScoreDescription,
    this.Remarks,
  );

  factory LearningAreas.fromJson(Map<String, dynamic> json) => _$LearningAreasFromJson(json);

  Map<String, dynamic> toJson() => _$LearningAreasToJson(this);

  @override
  String toString() => 'LearningAreas{ LearningArea: $LearningArea, ScoreDescription: $ScoreDescription, Remarks: $Remarks';
}