

import 'package:json_annotation/json_annotation.dart';

part 'portal_student_class_attendance_request_model.g.dart';

@JsonSerializable()
//attendance class
//TODO: change this to PortalStudentClassAttendanceRequest
class PortalStudentClassRequest{

  String StudentID;
  String YearID;
  String TermID;
  String OrganizationID;
  String AppCode;

  PortalStudentClassRequest(
    this.StudentID,
    this.YearID,
    this.TermID,
    this.OrganizationID,
    this.AppCode,
  );


  factory PortalStudentClassRequest.fromJson(Map<String, dynamic> json) => _$PortalStudentClassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PortalStudentClassRequestToJson(this);

    


  @override
  String toString() {
    return 'PortalStudentClassRequest{ StudentID: $StudentID, YearID: $YearID, TermID: $TermID, OrganizationID: $OrganizationID, AppCode: $AppCode';
  }
}