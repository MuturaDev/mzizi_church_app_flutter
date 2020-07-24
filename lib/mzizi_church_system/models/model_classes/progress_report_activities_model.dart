
import 'package:json_annotation/json_annotation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/prorgress_report_learning_area_model.dart';

part 'progress_report_activities_model.g.dart';

@JsonSerializable()
class Activities{

  String Activity;
  String CourseName;
  String LevelName;
  List<LearningAreas> learningAreaList;

  Activities(
    this.Activity,
    this.CourseName,
    this.LevelName,
    this.learningAreaList,
  );

  factory Activities.fromJson(Map<String, dynamic> json) => _$ActivitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ActivitiesToJson(this);

  @override
  String toString() {
    return 'Activities{ Activity: $Activity, CourseName: $CourseName, LevelName: $LevelName, learningAreaList: $learningAreaList';
  }
}