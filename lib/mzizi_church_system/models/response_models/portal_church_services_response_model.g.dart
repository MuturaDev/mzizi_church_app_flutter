// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_church_services_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalChurchServices _$PortalChurchServicesFromJson(Map<String, dynamic> json) {
  return PortalChurchServices(
      json['ID'] as String,
      json['ServiceDescription'] as String,
      json['StartTime'] as String,
      json['EndTime'] as String,
      json['Capacity'] as String,
      json['ServiceType'] as String,
      json['Description'] as String,
      json['Name'] as String,
      json['ChurchServiceDate'] as String);
}

Map<String, dynamic> _$PortalChurchServicesToJson(
        PortalChurchServices instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'ServiceDescription': instance.ServiceDescription,
      'StartTime': instance.StartTime,
      'EndTime': instance.EndTime,
      'Capacity': instance.Capacity,
      'ServiceType': instance.ServiceType,
      'Description': instance.Description,
      'Name': instance.Name,
      'ChurchServiceDate': instance.ChurchServiceDate
    };
