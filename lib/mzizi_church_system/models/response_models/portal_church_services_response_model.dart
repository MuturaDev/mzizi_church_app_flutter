import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_church_services_response_model.g.dart';

@JsonSerializable()
class PortalChurchServices {
  String ID;
  String ServiceDescription;
  String StartTime;
  String EndTime;
  String Capacity;
  String ServiceType;
  String Description;
  String Name;
  String ChurchServiceDate;

  PortalChurchServices(
    this.ID,
    this.ServiceDescription,
    this.StartTime,
    this.EndTime,
    this.Capacity,
    this.ServiceType,
    this.Description,
    this.Name,
    this.ChurchServiceDate,
  );


  factory PortalChurchServices.fromJson(Map<String,dynamic> json) => _$PortalChurchServicesFromJson(json);


  Map<String,dynamic> toJson() => _$PortalChurchServicesToJson(this);


  @override
  String toString() {
    return 'PortalChurchServices(ID: $ID, ServiceDescription: $ServiceDescription, StartTime: $StartTime, EndTime: $EndTime, Capacity: $Capacity, ServiceType: $ServiceType, Description: $Description, Name: $Name, ChurchServiceDate: $ChurchServiceDate)';
  }
}
