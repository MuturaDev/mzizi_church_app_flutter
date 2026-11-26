// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mzizi_app_version_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MziziAppVersion _$MziziAppVersionFromJson(Map<String, dynamic> json) =>
    MziziAppVersion(
      (json['id'] as num?)?.toInt(),
      json['ForceUpdate'] as bool?,
    );

Map<String, dynamic> _$MziziAppVersionToJson(MziziAppVersion instance) =>
    <String, dynamic>{'id': instance.id, 'ForceUpdate': instance.ForceUpdate};
