import 'package:json_annotation/json_annotation.dart';

part 'portal_enquiry_types_model.g.dart';

@JsonSerializable()
class PortalEnquiryTypes {
  String ID;
  String Name;

  PortalEnquiryTypes(
    this.ID,
    this.Name,
  );

  factory PortalEnquiryTypes.fromJson(Map<String,dynamic> json) => _$PortalEnquiryTypesFromJson(json);

  Map<String,dynamic> toJson() => _$PortalEnquiryTypesToJson(this);
  
  @override
  String toString() => 'PortalEnquiryTypes(ID: $ID, Name: $Name)';
}
