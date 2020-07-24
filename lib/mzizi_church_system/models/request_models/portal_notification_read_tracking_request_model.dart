

import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_notification_read_tracking_request_model.g.dart';

@entity
@JsonSerializable()
class PortalNotificationReadTracking{

    @PrimaryKey(autoGenerate: true)
    int id;
    String StudentID;
    String DateOpened;
    String AppCode;

  PortalNotificationReadTracking(
    this.id,
    this.StudentID,
    this.DateOpened,
    this.AppCode,
  );


  factory PortalNotificationReadTracking.fromJson(Map<String, dynamic> json) => _$PortalNotificationReadTrackingFromJson(json);

  Map<String,dynamic> toJson() => _$PortalNotificationReadTrackingToJson(this);

  @override
  String toString() => 'PortalNotificationReadTracking{ StudentID: $StudentID, DateOpened: $DateOpened, AppCode: $AppCode';
}