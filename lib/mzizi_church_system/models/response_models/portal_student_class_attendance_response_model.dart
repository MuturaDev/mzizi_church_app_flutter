
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_student_class_attendance_response_model.g.dart';

@entity
@JsonSerializable()
class PortalStudentClassAttendance{

  @PrimaryKey(autoGenerate: true)
  int id;
  String StudentName;
  String Status;
  String CourseName;
  String Remarks;
  String DateRecorded;
  String TermFor;
  String YearFor;
  String UnitName;
  String RollcallSessionName;

  PortalStudentClassAttendance(
    this.id,
    this.StudentName,
    this.Status,
    this.CourseName,
    this.Remarks,
    this.DateRecorded,
    this.TermFor,
    this.YearFor,
    this.UnitName,
    this.RollcallSessionName,
  );

  factory PortalStudentClassAttendance.fromJson(Map<String, dynamic> json) => _$PortalStudentClassAttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$PortalStudentClassAttendanceToJson(this);
  

  @override
  String toString() {
    return 'PortalStudentClassAttendance{ StudentName: $StudentName, Status: $Status, CourseName: $CourseName, Remarks: $Remarks, DateRecorded: $DateRecorded, TermFor: $TermFor, YearFor: $YearFor, UnitName: $UnitName, RollcallSessionName: $RollcallSessionName';
  }
}