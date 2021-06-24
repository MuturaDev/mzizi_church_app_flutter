// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_parent_chat_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalParentChatRequest _$PortalParentChatRequestFromJson(
    Map<String, dynamic> json) {
  return PortalParentChatRequest(
      json['studentID'] as String,
      json['Msg'] as String,
      json['staffID'] as String,
      json['appCode'] as String,
      json['enquiryTypeID'] as String);
}

Map<String, dynamic> _$PortalParentChatRequestToJson(
        PortalParentChatRequest instance) =>
    <String, dynamic>{
      'studentID': instance.studentID,
      'Msg': instance.Msg,
      'staffID': instance.staffID,
      'appCode': instance.appCode,
      'enquiryTypeID': instance.enquiryTypeID
    };
