
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_contacts_response_model.g.dart';

@entity
@JsonSerializable()
class PortalContacts{

  @PrimaryKey(autoGenerate: true)
  int id;
  String SettingName;
  String SettingValue;

  PortalContacts(this.id,this.SettingName, this.SettingValue);

  factory  PortalContacts.fromJson(Map<String, dynamic> json) => _$PortalContactsFromJson(json);

  Map<String, dynamic> toJson() => _$PortalContactsToJson(this);

    @override
    String toString() {
      return 'PortalContacts{SettingName: $SettingName, SettingValue: $SettingValue}';
    }
}
