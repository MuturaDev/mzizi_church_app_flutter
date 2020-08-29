import 'package:json_annotation/json_annotation.dart';

part 'portal_student_model.g.dart';

@JsonSerializable()
class Student {
  String StudentID;
  String AppCode;
  String OrganizationID;

  Student(
    this.StudentID,
    this.AppCode,
  );

  

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);

  @override
  String toString() => 'Student{ StudentID: $StudentID, AppCode: $AppCode';
}
