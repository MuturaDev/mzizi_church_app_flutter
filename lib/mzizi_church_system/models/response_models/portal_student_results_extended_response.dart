
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_student_results_extended_response.g.dart';

@entity
@JsonSerializable()
class PortalStudentResultsExtended {

  @PrimaryKey(autoGenerate: true)
  int id;
  String ExamPeriod;
  String AvgScore;
  String MeanGrade;
  String ExamRemarks;
  String DownloadLink;
  String FileURL;

  PortalStudentResultsExtended(
    this.id,
    this.ExamPeriod,
    this.AvgScore,
    this.MeanGrade,
    this.ExamRemarks,
    this.DownloadLink,
    this.FileURL,
  );


  factory PortalStudentResultsExtended.fromJson(Map<String,dynamic> json) => _$PortalStudentResultsExtendedFromJson(json);

  Map<String, dynamic> toJson() => _$PortalStudentResultsExtendedToJson(this);
  
  @override
  String toString() {
    return 'PortalStudentResultsExtended(id: $id, ExamPeriod: $ExamPeriod, AvgScore: $AvgScore, MeanGrade: $MeanGrade, ExamRemarks: $ExamRemarks, DownloadLink: $DownloadLink, FileURL: $FileURL)';
  }
}
