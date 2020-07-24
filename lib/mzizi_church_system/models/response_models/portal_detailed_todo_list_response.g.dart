// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_detailed_todo_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalDetailedTodoList _$PortalDetailedTodoListFromJson(
    Map<String, dynamic> json) {
  return PortalDetailedTodoList(
      json['id'] as int,
      json['Name'] as String,
      json['ToDoAge'] as String,
      json['DueDate'] as String,
      json['DocPath'] as String,
      json['Body'] as String,
      json['UnitName'] as String,
      json['TeacherMemoID'] as String,
      json['IsFeedbackRequired'] as String,
      json['IsDocPathAvailable'] as String,
      json['IsVideoLinkAvailable'] as String,
      json['IsDocPathExtraAvailable'] as String,
      json['IsAudioLinkAvailable'] as String,
      json['DocPathExtra'] as String,
      json['VideoLink'] as String,
      json['AudioLink'] as String,
      json['TimeOffSet'] as String,
      json['PublishDate'] as String,
      json['StartTime'] as String,
      json['EndTime'] as String,
      json['SubmitStatus'] as String);
}

Map<String, dynamic> _$PortalDetailedTodoListToJson(
        PortalDetailedTodoList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Name': instance.Name,
      'ToDoAge': instance.ToDoAge,
      'DueDate': instance.DueDate,
      'DocPath': instance.DocPath,
      'Body': instance.Body,
      'UnitName': instance.UnitName,
      'TeacherMemoID': instance.TeacherMemoID,
      'IsFeedbackRequired': instance.IsFeedbackRequired,
      'IsDocPathAvailable': instance.IsDocPathAvailable,
      'IsVideoLinkAvailable': instance.IsVideoLinkAvailable,
      'IsDocPathExtraAvailable': instance.IsDocPathExtraAvailable,
      'IsAudioLinkAvailable': instance.IsAudioLinkAvailable,
      'DocPathExtra': instance.DocPathExtra,
      'VideoLink': instance.VideoLink,
      'AudioLink': instance.AudioLink,
      'TimeOffSet': instance.TimeOffSet,
      'PublishDate': instance.PublishDate,
      'StartTime': instance.StartTime,
      'EndTime': instance.EndTime,
      'SubmitStatus': instance.SubmitStatus
    };
