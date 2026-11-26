import 'package:json_annotation/json_annotation.dart';

part 'portal_to_do_list_response.g.dart';
@JsonSerializable()
class PortalToDoList {
  int? id;
  String? DiaryEntryTypeID;
  String? DiaryEntryType;
  String? DiaryEntriesCount;

  PortalToDoList(
    this.id,
    this.DiaryEntryTypeID,
    this.DiaryEntryType,
    this.DiaryEntriesCount,
  );

  factory PortalToDoList.fromJson(Map<String, dynamic> json) =>
      _$PortalToDoListFromJson(json);

  Map<String, dynamic> toJson() => _$PortalToDoListToJson(this);

  @override
  String toString() {
    return 'PortalToDoList(id: $id, DiaryEntryTypeID: $DiaryEntryTypeID, DiaryEntryType: $DiaryEntryType, DiaryEntriesCount: $DiaryEntriesCount)';
  }
}
