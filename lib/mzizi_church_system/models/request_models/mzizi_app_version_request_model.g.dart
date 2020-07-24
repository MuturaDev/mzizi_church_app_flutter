// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mzizi_app_version_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MziziAppVersionRequest _$MziziAppVersionRequestFromJson(
    Map<String, dynamic> json) {
  return MziziAppVersionRequest(
      json['VersionName'] as String, json['VersionCode'] as String);
}

Map<String, dynamic> _$MziziAppVersionRequestToJson(
        MziziAppVersionRequest instance) =>
    <String, dynamic>{
      'VersionName': instance.VersionName,
      'VersionCode': instance.VersionCode
    };
