

import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mzizi_app_version_response_model.g.dart';

@entity
@JsonSerializable()
class MziziAppVersion{

  @PrimaryKey(autoGenerate: true)
  int id;
  bool ForceUpdate;

  MziziAppVersion(
    this.id,
    this.ForceUpdate,
  );

  factory MziziAppVersion.fromJson(Map<String, dynamic> json) => _$MziziAppVersionFromJson(json);

  Map<String, dynamic> toJson() => _$MziziAppVersionToJson(this);
  
  @override
  String toString() => 'MziziAppVersion{ ForceUpdate: $ForceUpdate';
}