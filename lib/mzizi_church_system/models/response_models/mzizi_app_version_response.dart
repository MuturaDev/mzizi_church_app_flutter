

import 'package:json_annotation/json_annotation.dart';

part 'mzizi_app_version_response.g.dart';

@JsonSerializable()
class MziziAppVersion {
    bool ForceUpdate;

  MziziAppVersion(
    this.ForceUpdate,
  );

  factory MziziAppVersion.fromJson(Map<String,dynamic> json) => _$MziziAppVersionFromJson(json);

  Map<String,dynamic> toJson() => _$MziziAppVersionToJson(this);
    
  @override
  String toString() => 'MziziAppVersion(ForceUpdate: $ForceUpdate)';
}
