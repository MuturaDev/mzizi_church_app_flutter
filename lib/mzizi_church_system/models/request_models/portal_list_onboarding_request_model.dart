

import 'package:json_annotation/json_annotation.dart';

part 'portal_list_onboarding_request_model.g.dart';

@JsonSerializable()
class ListOnboardingRequest {

  String StudentID;
  String ListOnBoardingID;
  String IsChecked;
  String AppCode;
  String Method;
  String MembershipCharge;

  ListOnboardingRequest(
    this.StudentID,
    this.ListOnBoardingID,
    this.IsChecked,
    this.AppCode,
    this.Method,
    this.MembershipCharge,
  );

  factory ListOnboardingRequest.fromJson(Map<String, dynamic> json) => _$ListOnboardingRequestFromJson(json);

  Map<String,dynamic> toJson() => _$ListOnboardingRequestToJson(this);


  @override
  String toString() {
    return 'ListOnboardingRequest(StudentID: $StudentID, ListOnBoardingID: $ListOnBoardingID, IsChecked: $IsChecked, AppCode: $AppCode, Method: $Method, MembershipCharge: $MembershipCharge)';
  }
}
