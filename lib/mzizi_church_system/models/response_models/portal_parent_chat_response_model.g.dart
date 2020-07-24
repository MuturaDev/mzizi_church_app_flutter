// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_parent_chat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentChatResponse _$ParentChatResponseFromJson(Map<String, dynamic> json) {
  return ParentChatResponse(
      json['id'] as int,
      json['Msg'] as String,
      json['DatePosted'] as String,
      json['Actor'] as String,
      json['sent'] as bool,
      json['notSent'] as bool,
      json['sending'] as bool);
}

Map<String, dynamic> _$ParentChatResponseToJson(ParentChatResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Msg': instance.Msg,
      'DatePosted': instance.DatePosted,
      'Actor': instance.Actor,
      'sent': instance.sent,
      'notSent': instance.notSent,
      'sending': instance.sending
    };
