// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_list_onboarding_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOnboardingRequest _$ListOnboardingRequestFromJson(
    Map<String, dynamic> json) {
  return ListOnboardingRequest(
      json['StudentID'] as String,
      json['ListOnBoardingID'] as String,
      json['IsChecked'] as String,
      json['AppCode'] as String,
      json['Method'] as String,
      json['MembershipCharge'] as String);
}

Map<String, dynamic> _$ListOnboardingRequestToJson(
        ListOnboardingRequest instance) =>
    <String, dynamic>{
      'StudentID': instance.StudentID,
      'ListOnBoardingID': instance.ListOnBoardingID,
      'IsChecked': instance.IsChecked,
      'AppCode': instance.AppCode,
      'Method': instance.Method,
      'MembershipCharge': instance.MembershipCharge
    };
