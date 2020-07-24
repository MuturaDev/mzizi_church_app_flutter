import 'package:json_annotation/json_annotation.dart';

part 'portal_parent_chat_message_model.g.dart';

@JsonSerializable()
class PortalChatUser { 
  bool isSender;
  PortalChatUser({
    this.isSender,
  });

  factory PortalChatUser.fromJson(Map<String, dynamic> json) => _$PortalChatUserFromJson(json);

  Map<String, dynamic> toJson() => _$PortalChatUserToJson(this);

  @override
  String toString() => 'PortalChatUser isSender: $isSender';
}

@JsonSerializable()
class PortalChatMessage {
  String message;
  PortalChatUser sender;
  String createdAt;
  bool showLoading;
  bool showCanceled;
  bool showSuccess;

  PortalChatMessage(
    this.message,
    this.sender,
    this.createdAt,
    this.showLoading,
    this.showCanceled,
    this.showSuccess,
  );

  factory PortalChatMessage.fromJson(Map<String, dynamic> json) => _$PortalChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$PortalChatMessageToJson(this);

  @override
  String toString() {
    return 'PortalChatMessage message: $message, sender: $sender, createdAt: $createdAt, showLoading: $showLoading, showCanceled: $showCanceled, showSuccess: $showSuccess';
  }
}
