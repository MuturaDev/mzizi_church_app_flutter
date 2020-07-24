import 'package:floor/floor.dart';

import 'package:json_annotation/json_annotation.dart';

part 'portal_events_response_model.g.dart';

@entity
@JsonSerializable()
class PortalEvents{

  @PrimaryKey(autoGenerate: true)
  int id;
  String EventsTitle;
  String Venue;
  String StartDate;
  String EndDate;
  String StartTime;
  String EndTime;
  String Description;

  PortalEvents(
    this.id,
    this.EventsTitle,
    this.Venue,
    this.StartDate,
    this.EndDate,
    this.StartTime,
    this.EndTime,
    this.Description,
  );

    factory PortalEvents.fromJson(Map<String, dynamic> json) => _$PortalEventsFromJson(json);

    Map<String, dynamic> toJson() => _$PortalEventsToJson(this);

  @override
  String toString() {
    return 'PortalEvents{ EventsTitle: $EventsTitle, Venue: $Venue, StartDate: $StartDate, EndDate: $EndDate, StartTime: $StartTime, EndTime: $EndTime, Description: $Description';
  }
}