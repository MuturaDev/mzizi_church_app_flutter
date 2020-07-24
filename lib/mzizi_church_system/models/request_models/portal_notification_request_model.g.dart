// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_notification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalNotificationRequest _$PortalNotificationRequestFromJson(
    Map<String, dynamic> json) {
  return PortalNotificationRequest(json['StudentID'] as String,
      json['AppCode'] as String, json['MsgID'] as String);
}

Map<String, dynamic> _$PortalNotificationRequestToJson(
        PortalNotificationRequest instance) =>
    <String, dynamic>{
      'StudentID': instance.StudentID,
      'AppCode': instance.AppCode,
      'MsgID': instance.MsgID
    };
