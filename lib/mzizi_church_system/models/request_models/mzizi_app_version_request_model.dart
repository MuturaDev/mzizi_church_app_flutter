


import 'package:json_annotation/json_annotation.dart';

part 'mzizi_app_version_request_model.g.dart';

@JsonSerializable()
class MziziAppVersionRequest{

  String VersionName;
  String VersionCode;

  MziziAppVersionRequest(
    this.VersionName,
    this.VersionCode,
  );

  factory MziziAppVersionRequest.fromJson(Map<String, dynamic> json) => _$MziziAppVersionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MziziAppVersionRequestToJson(this);
  
  @override
  String toString() => 'MziziAppVersionRequest{ VersionName: $VersionName, VersionCode: $VersionCode';
}