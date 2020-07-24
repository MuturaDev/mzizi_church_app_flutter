import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_student_detailed_results_response_model.g.dart';

@entity
@JsonSerializable()
class PortalStudentDetailedResults{

  @PrimaryKey(autoGenerate: true)
  int id;
  String Subjects;
  String Score;
  String Grade;
  String Remark;
  String TotalMarks;
  String MeanScore;
  String MeanGrade;
  String StreamPosition;
  String OverallPosition;
  String Period;
  String TermName;
  String CurrentYear;
  String CTComments;
  String HMComments;

  PortalStudentDetailedResults(
    this.id,
    this.Subjects,
    this.Score,
    this.Grade,
    this.Remark,
    this.TotalMarks,
    this.MeanScore,
    this.MeanGrade,
    this.StreamPosition,
    this.OverallPosition,
    this.Period,
    this.TermName,
    this.CurrentYear,
    this.CTComments,
    this.HMComments,
  );

  
  factory PortalStudentDetailedResults.fromJson(Map<String, dynamic> json) => _$PortalStudentDetailedResultsFromJson(json);

  Map<String, dynamic> toJson() => _$PortalStudentDetailedResultsToJson(this);



  @override
  String toString() {
    return 'PortalStudentDetailedResults{ Subjects: $Subjects, Score: $Score, Grade: $Grade, Remarks: $Remark, TotalMarks: $TotalMarks, MeanScore: $MeanScore, MeanGrade: $MeanGrade, StreamPosition: $StreamPosition, OvarllPosition: $OverallPosition, Period: $Period, TermName: $TermName, CurrentYear: $CurrentYear, CtComments: $CTComments, HmComments: $HMComments';
  }
}