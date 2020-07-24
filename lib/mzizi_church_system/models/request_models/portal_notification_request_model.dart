
import 'package:json_annotation/json_annotation.dart';

part 'portal_notification_request_model.g.dart';

@JsonSerializable()
class PortalNotificationRequest{

  String StudentID;
  String AppCode;
  String MsgID;

  PortalNotificationRequest(
    this.StudentID,
    this.AppCode,
    this.MsgID,
  );

  
  factory PortalNotificationRequest.fromJson(Map<String, dynamic> json) => _$PortalNotificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PortalNotificationRequestToJson(this);

  
  @override
  String toString() => 'PortalNotificationRequest{ StudentID: $StudentID, AppCode: $AppCode, MsgID: $MsgID';
}