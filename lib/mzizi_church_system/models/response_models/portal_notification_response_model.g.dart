// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_notification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalNotification _$PortalNotificationFromJson(Map<String, dynamic> json) =>
    PortalNotification(
      (json['id'] as num?)?.toInt(),
      (json['MsgID'] as num?)?.toInt(),
      json['Msg'] as String?,
      json['DateSent'] as String?,
    );

Map<String, dynamic> _$PortalNotificationToJson(PortalNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'MsgID': instance.MsgID,
      'Msg': instance.Msg,
      'DateSent': instance.DateSent,
    };
