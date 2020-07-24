// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_global_settings_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalGlobalSettings _$PortalGlobalSettingsFromJson(Map<String, dynamic> json) {
  return PortalGlobalSettings(
      json['id'] as int,
      json['SettingName'] as String,
      json['OrganizationID'] as String,
      json['AppCode'] as String,
      json['SettingValue'] as String);
}

Map<String, dynamic> _$PortalGlobalSettingsToJson(
        PortalGlobalSettings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'SettingName': instance.SettingName,
      'OrganizationID': instance.OrganizationID,
      'AppCode': instance.AppCode,
      'SettingValue': instance.SettingValue
    };
