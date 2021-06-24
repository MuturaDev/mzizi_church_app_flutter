// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_list_onboarding_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalListOnboardingResponseModel _$PortalListOnboardingResponseModelFromJson(
    Map<String, dynamic> json) {
  return PortalListOnboardingResponseModel(
      json['ID'] as String,
      json['Title'] as String,
      json['Description'] as String,
      json['ExpiryDate'] as String,
      json['IsChecked'] as String,
      json['AmountCharged'] as String);
}

Map<String, dynamic> _$PortalListOnboardingResponseModelToJson(
        PortalListOnboardingResponseModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'Title': instance.Title,
      'Description': instance.Description,
      'ExpiryDate': instance.ExpiryDate,
      'IsChecked': instance.IsChecked,
      'AmountCharged': instance.AmountCharged
    };
