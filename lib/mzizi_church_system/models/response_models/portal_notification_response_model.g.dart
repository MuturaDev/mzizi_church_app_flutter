// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_notification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalNotification _$PortalNotificationFromJson(Map<String, dynamic> json) {
  return PortalNotification(json['id'] as int, json['MsgID'] as int,
      json['Msg'] as String, json['DateSent'] as String);
}

Map<String, dynamic> _$PortalNotificationToJson(PortalNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'MsgID': instance.MsgID,
      'Msg': instance.Msg,
      'DateSent': instance.DateSent
    };
