
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_detailed_todo_list_response.g.dart';

@entity
@JsonSerializable()
class PortalDetailedTodoList {

  @PrimaryKey(autoGenerate: true)
  int id;
  String Name;
  String ToDoAge;
  String DueDate;
  String DocPath;
  String Body;
  String UnitName;
  String TeacherMemoID;
  String IsFeedbackRequired;
  String IsDocPathAvailable;
  String IsVideoLinkAvailable;
  String IsDocPathExtraAvailable;
  String IsAudioLinkAvailable;
  String DocPathExtra;
  String VideoLink;
  String AudioLink;
  String TimeOffSet;
  String PublishDate;
  String StartTime;
  String EndTime;
  String SubmitStatus;

  PortalDetailedTodoList(
    this.id,
    this.Name,
    this.ToDoAge,
    this.DueDate,
    this.DocPath,
    this.Body,
    this.UnitName,
    this.TeacherMemoID,
    this.IsFeedbackRequired,
    this.IsDocPathAvailable,
    this.IsVideoLinkAvailable,
    this.IsDocPathExtraAvailable,
    this.IsAudioLinkAvailable,
    this.DocPathExtra,
    this.VideoLink,
    this.AudioLink,
    this.TimeOffSet,
    this.PublishDate,
    this.StartTime,
    this.EndTime,
    this.SubmitStatus,
  );

  factory PortalDetailedTodoList.fromJson(Map<String, dynamic> json) => _$PortalDetailedTodoListFromJson(json);

  Map<String,dynamic> toJson() => _$PortalDetailedTodoListToJson(this);

  @override
  String toString() {
    return 'PortalDetailedTodoList(id: $id, Name: $Name, ToDoAge: $ToDoAge, DueDate: $DueDate, DocPath: $DocPath, Body: $Body, UnitName: $UnitName, TeacherMemoID: $TeacherMemoID, IsFeedbackRequired: $IsFeedbackRequired, IsDocPathAvailable: $IsDocPathAvailable, IsVideoLinkAvailable: $IsVideoLinkAvailable, IsDocPathExtraAvailable: $IsDocPathExtraAvailable, IsAudioLinkAvailable: $IsAudioLinkAvailable, DocPathExtra: $DocPathExtra, VideoLink: $VideoLink, AudioLink: $AudioLink, TimeOffSet: $TimeOffSet, PublishDate: $PublishDate, StartTime: $StartTime, EndTime: $EndTime, SubmitStatus: $SubmitStatus)';
  }
}
