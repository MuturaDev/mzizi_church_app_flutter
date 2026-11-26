


import 'package:json_annotation/json_annotation.dart';

part 'app_notification_count.g.dart';
@JsonSerializable()
class AppNotificationCount{
  int? MsgID;
  
  AppNotificationCount(
    this.MsgID,
  );

  factory AppNotificationCount.fromJson(Map<String,dynamic> json) => _$AppNotificationCountFromJson(json);
  
  Map<String, dynamic> toJson() => _$AppNotificationCountToJson(this);

  @override
  String toString() => 'AppNotificationCount{ MsgID: $MsgID}';
}