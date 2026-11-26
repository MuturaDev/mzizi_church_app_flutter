
import 'package:json_annotation/json_annotation.dart';

part 'portal_filtered_student_info_response_model.g.dart';
@JsonSerializable()
class PortalFilteredStudentInfo{
  int? id;
  String? Balance;
  String? BillingBalance;
  String? PortalAccount;
  String? PortalPaybill;
  String? OrganizationID;

  PortalFilteredStudentInfo(
    this.id,
    this.Balance,
    this.BillingBalance,
    this.PortalAccount,
    this.PortalPaybill,
    this.OrganizationID,
  );


  factory PortalFilteredStudentInfo.fromJson(Map<String,dynamic> json) => _$PortalFilteredStudentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PortalFilteredStudentInfoToJson(this);



  @override
  String toString() {
    return 'PortalFilteredStudentInfo{ Balance: $Balance, BillingBalance: $BillingBalance, PortalAccount: $PortalAccount, PortalPaybill: $PortalPaybill, OrganizationID: $OrganizationID';
  }
}