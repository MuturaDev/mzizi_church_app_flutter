// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_contacts_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalContacts _$PortalContactsFromJson(Map<String, dynamic> json) {
  return PortalContacts(json['id'] as int, json['SettingName'] as String,
      json['SettingValue'] as String);
}

Map<String, dynamic> _$PortalContactsToJson(PortalContacts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'SettingName': instance.SettingName,
      'SettingValue': instance.SettingValue
    };
