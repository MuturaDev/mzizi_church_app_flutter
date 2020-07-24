import 'package:floor/floor.dart';

import 'package:json_annotation/json_annotation.dart';

part 'portal_progress_report_response_model.g.dart';

@entity
@JsonSerializable()
class PortalProgressReport{

  @PrimaryKey(autoGenerate: true)
  int id;
  String StudentFullName;
  String YearID;
  String TermName;
  String ExamTypeDesc;
  String CourseName;
  String LevelName;
  String Activity;
  String LearningArea;
  String Remarks;
  String ScoreDescription;
  String ClassTeacherComment;
  String HeadTeacherComment;

  PortalProgressReport(
    this.id,
    this.StudentFullName,
    this.YearID,
    this.TermName,
    this.ExamTypeDesc,
    this.CourseName,
    this.LevelName,
    this.Activity,
    this.LearningArea,
    this.Remarks,
    this.ScoreDescription,
    this.ClassTeacherComment,
    this.HeadTeacherComment,
  );


  factory PortalProgressReport.fromJson(Map<String, dynamic> json) => _$PortalProgressReportFromJson(json);

  Map<String, dynamic> toJson() => _$PortalProgressReportToJson(this);


  @override
  String toString() {
    return 'PortalProgressReport{ StudentFullName: $StudentFullName, YearID: $YearID, TermName: $TermName, ExamTypeDesc: $ExamTypeDesc, CourseName: $CourseName, LevelName: $LevelName, Activity: $Activity, LearningArea: $LearningArea, Remarks: $Remarks, ScoreDescription: $ScoreDescription, ClassTeacherComment: $ClassTeacherComment, HeadTeacherComment: $HeadTeacherComment';
  }
}