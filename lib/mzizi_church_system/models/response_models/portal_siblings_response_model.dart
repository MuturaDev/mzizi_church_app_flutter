

import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_siblings_response_model.g.dart';

@entity
@JsonSerializable()
class PortalSiblings{

  @PrimaryKey(autoGenerate: true)
  int id;
  String StudentID;
  String RegistrationNumber;
  String StudentFullName;
  String CourseName;
  String StudentStatus;

  PortalSiblings(
    this.id,
    this.StudentID,
    this.RegistrationNumber,
    this.StudentFullName,
    this.CourseName,
    this.StudentStatus,
  );


  factory PortalSiblings.fromJson(Map<String, dynamic> json) => _$PortalSiblingsFromJson(json);

  Map<String, dynamic> toJson() => _$PortalSiblingsToJson(this);

  @override
  String toString() {
    return 'PortalSiblings{ StudentID: $StudentID, RegistrationNumber: $RegistrationNumber, StudentFullName: $StudentFullName, CourseName: $CourseName, StudentStatus: $StudentStatus';
  }
}