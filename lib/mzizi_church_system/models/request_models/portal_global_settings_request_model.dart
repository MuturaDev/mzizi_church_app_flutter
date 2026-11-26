

import 'package:json_annotation/json_annotation.dart';

part 'portal_global_settings_request_model.g.dart';
@JsonSerializable()
class PortalGlobalSettings{
  int? id;
  String? SettingName;
  String? OrganizationID;
  String? AppCode;
  String? SettingValue;
  
  
  PortalGlobalSettings(
    this.id,
    this.SettingName,
    this.OrganizationID,
    this.AppCode,
    this.SettingValue,
  );


  factory PortalGlobalSettings.fromJson(Map<String, dynamic> json) => _$PortalGlobalSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$PortalGlobalSettingsToJson(this);

 

  @override
  String toString() {
    return 'PortalGlobalSettings{ SettingName: $SettingName, OrganizationID: $OrganizationID, AppCode: $AppCode, SettingValue: $SettingValue';
  }
}