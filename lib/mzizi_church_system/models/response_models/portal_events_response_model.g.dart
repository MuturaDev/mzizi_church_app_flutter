// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_events_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalEvents _$PortalEventsFromJson(Map<String, dynamic> json) {
  return PortalEvents(
      json['id'] as int,
      json['EventsTitle'] as String,
      json['Venue'] as String,
      json['StartDate'] as String,
      json['EndDate'] as String,
      json['StartTime'] as String,
      json['EndTime'] as String,
      json['Description'] as String);
}

Map<String, dynamic> _$PortalEventsToJson(PortalEvents instance) =>
    <String, dynamic>{
      'id': instance.id,
      'EventsTitle': instance.EventsTitle,
      'Venue': instance.Venue,
      'StartDate': instance.StartDate,
      'EndDate': instance.EndDate,
      'StartTime': instance.StartTime,
      'EndTime': instance.EndTime,
      'Description': instance.Description
    };
