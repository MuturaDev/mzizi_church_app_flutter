

import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_notification_response_model.g.dart';

@entity
@JsonSerializable()
class PortalNotification{

  @PrimaryKey(autoGenerate: true)
  int id;
  int MsgID;
  String Msg;
  String DateSent;

  PortalNotification(
    this.id,
    this.MsgID,
    this.Msg,
    this.DateSent,
  );

  factory PortalNotification.fromJson(Map<String, dynamic> json) => _$PortalNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$PortalNotificationToJson(this);
  

  @override
  String toString() => 'PortalNotification{ MsgID: $MsgID, Msg: $Msg, DateSent: $DateSent';
}