import 'package:json_annotation/json_annotation.dart';

part 'self_enroll_application_request_model.g.dart';

@JsonSerializable()
class PortalSelfEnrollApplication {
  String FormatedDateBooked;
  String StartTime;
  String Age;
  String ChurchServiceID;
  String OrganizationID;
  String DateBooked;
  String StudentID;
  String AppCode;
  

  PortalSelfEnrollApplication(
    this.FormatedDateBooked,
    this.StartTime,
    this.Age,
    this.ChurchServiceID,
    this.OrganizationID,
    this.DateBooked,
    this.StudentID,
    this.AppCode
  );

  factory PortalSelfEnrollApplication.fromJson(Map<String, dynamic> json) =>
      _$PortalSelfEnrollApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$PortalSelfEnrollApplicationToJson(this);

  @override
  String toString() {
    return 'PortalSelfEnrollApplication(FormatedDateBooked: $FormatedDateBooked, StartTime: $StartTime, Age: $Age, ChurchServiceID: $ChurchServiceID, OrganizationID: $OrganizationID, DateBooked: $DateBooked)';
  }
}
