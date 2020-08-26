import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'charge_type_response_model.g.dart';

@JsonSerializable()
class PortalChargeTypeResponseModel {

  String ID;
  String ChargeTypeName;

  PortalChargeTypeResponseModel(
    this.ID,
    this.ChargeTypeName,
  );


  factory PortalChargeTypeResponseModel.fromJson(Map<String, dynamic> json) => _$PortalChargeTypeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PortalChargeTypeResponseModelToJson(this);
  
  @override
  String toString() => 'PortalChargeTypeResponseModel(ID: $ID, ChargeTypeName: $ChargeTypeName)';
}
