

import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_student_info_response_model.g.dart';

@entity
@JsonSerializable()
class PortalStudentInfo{

  @PrimaryKey(autoGenerate: true)
  int id;
  String StudentFullName;
  String RegistrationNumber;
  String Email;
  String StudentPhoneNo;
  String DOB;
  String DateOfAdmission;
  String TwoNames;
  String Balance;
  String MeanGrade;
  String MeanScore;
  String Attendance;
  String Events;
  String PhotoUrl;
  String CopyrightYear;
  String ClassStream;
  String SchoolName;
  String SchoolMotto;
  String BillingBalance;
  String PortalAccount;
  String PortalPaybill;
  String OrganizationID;


  PortalStudentInfo(
    this.id,
    this.StudentFullName,
    this.RegistrationNumber,
    this.Email,
    this.StudentPhoneNo,
    this.DOB,
    this.DateOfAdmission,
    this.TwoNames,
    this.Balance,
    this.MeanGrade,
    this.MeanScore,
    this.Attendance,
    this.Events,
    this.PhotoUrl,
    this.CopyrightYear,
    this.ClassStream,
    this.SchoolName,
    this.SchoolMotto,
    this.BillingBalance,
    this.PortalAccount,
    this.PortalPaybill,
    this.OrganizationID,
  );

  factory PortalStudentInfo.fromJson(Map<String, dynamic> json) => _$PortalStudentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PortalStudentInfoToJson(this);
  

  @override
  String toString() {
    return 'PortalStudentInfo{ StudentFullName: $StudentFullName, RegistrationNumber: $RegistrationNumber, Email: $Email, StudentPhoneNo: $StudentPhoneNo, DOB: $DOB, DateOfAdmission: $DateOfAdmission, TwoNames: $TwoNames, Balance: $Balance, MeanGrade: $MeanGrade, MeanScore: $MeanScore, Attendance: $Attendance, Events: $Events, PhotoUrl: $PhotoUrl, CopyrightYear: $CopyrightYear, ClassStream: $ClassStream, SchoolName: $SchoolName, SchoolMotto: $SchoolMotto, BillingBalance: $BillingBalance, PortalAccount: $PortalAccount, PortalPaybill: $PortalPaybill, OrganizationID: $OrganizationID';
  }
}