
import 'package:json_annotation/json_annotation.dart';

part 'portal_list_onboarding_response_model.g.dart';

@JsonSerializable()
class PortalListOnboardingResponseModel {

  String ID;
  String Title;
  String Description;
  String ExpiryDate;
  String IsChecked;
  String AmountCharged;

  PortalListOnboardingResponseModel(
    this.ID,
    this.Title,
    this.Description,
    this.ExpiryDate,
    this.IsChecked,
    this.AmountCharged,
  );

  factory PortalListOnboardingResponseModel.fromJson(Map<String, dynamic> json) => _$PortalListOnboardingResponseModelFromJson(json);

  Map<String,dynamic> toJson() => _$PortalListOnboardingResponseModelToJson(this);


  @override
  String toString() {
    return 'PortalListOnboardingResponseModel(ID: $ID, Title: $Title, Description: $Description, ExpiryDate: $ExpiryDate, IsChecked: $IsChecked, AmountCharged: $AmountCharged)';
  }
}
