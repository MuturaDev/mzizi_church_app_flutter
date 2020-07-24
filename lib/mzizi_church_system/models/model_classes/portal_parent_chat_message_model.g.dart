// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_parent_chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalChatUser _$PortalChatUserFromJson(Map<String, dynamic> json) {
  return PortalChatUser(isSender: json['isSender'] as bool);
}

Map<String, dynamic> _$PortalChatUserToJson(PortalChatUser instance) =>
    <String, dynamic>{'isSender': instance.isSender};

PortalChatMessage _$PortalChatMessageFromJson(Map<String, dynamic> json) {
  return PortalChatMessage(
      json['message'] as String,
      json['sender'] == null
          ? null
          : PortalChatUser.fromJson(json['sender'] as Map<String, dynamic>),
      json['createdAt'] as String,
      json['showLoading'] as bool,
      json['showCanceled'] as bool,
      json['showSuccess'] as bool);
}

Map<String, dynamic> _$PortalChatMessageToJson(PortalChatMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sender': instance.sender,
      'createdAt': instance.createdAt,
      'showLoading': instance.showLoading,
      'showCanceled': instance.showCanceled,
      'showSuccess': instance.showSuccess
    };
