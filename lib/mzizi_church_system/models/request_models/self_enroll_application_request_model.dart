

import 'package:json_annotation/json_annotation.dart';

part 'self_enroll_application_request_model.g.dart';

@JsonSerializable()
class PortalSelfEnrollApplication {
  String Firstname;
  String Lastname;
  String PhoneNumber;
  String EmailAddress;
  String Age;
  String ChurchServiceID;
  String OrganizationID;
  String DateBooked;
  String AppCode;

  PortalSelfEnrollApplication(
    this.Firstname,
    this.Lastname,
    this.PhoneNumber,
    this.EmailAddress,
    this.Age,
    this.ChurchServiceID,
    this.OrganizationID,
    this.DateBooked,
    this.AppCode,
  );


  factory PortalSelfEnrollApplication.fromJson(Map<String, dynamic> json) => _$PortalSelfEnrollApplicationFromJson(json);

  Map<String,dynamic> toJson() => _$PortalSelfEnrollApplicationToJson(this);

  @override
  String toString() {
    return 'PortalSelfEnrollApplication(Firstname: $Firstname, Lastname: $Lastname, PhoneNumber: $PhoneNumber, EmailAddress: $EmailAddress, Age: $Age, ChurchServiceID: $ChurchServiceID, OrganizationID: $OrganizationID, DateBooked: $DateBooked, AppCode: $AppCode)';
  }
}
