// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_to_do_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalToDoList _$PortalToDoListFromJson(Map<String, dynamic> json) {
  return PortalToDoList(json['id'] as int, json['DiaryEntryTypeID'] as String,
      json['DiaryEntryType'] as String, json['DiaryEntriesCount'] as String);
}

Map<String, dynamic> _$PortalToDoListToJson(PortalToDoList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'DiaryEntryTypeID': instance.DiaryEntryTypeID,
      'DiaryEntryType': instance.DiaryEntryType,
      'DiaryEntriesCount': instance.DiaryEntriesCount
    };
