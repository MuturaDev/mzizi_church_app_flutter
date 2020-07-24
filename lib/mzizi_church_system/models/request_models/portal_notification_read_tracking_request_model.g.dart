// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_notification_read_tracking_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalNotificationReadTracking _$PortalNotificationReadTrackingFromJson(
    Map<String, dynamic> json) {
  return PortalNotificationReadTracking(
      json['id'] as int,
      json['StudentID'] as String,
      json['DateOpened'] as String,
      json['AppCode'] as String);
}

Map<String, dynamic> _$PortalNotificationReadTrackingToJson(
        PortalNotificationReadTracking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'StudentID': instance.StudentID,
      'DateOpened': instance.DateOpened,
      'AppCode': instance.AppCode
    };
