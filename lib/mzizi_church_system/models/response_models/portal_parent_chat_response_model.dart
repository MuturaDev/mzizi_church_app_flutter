

import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_parent_chat_response_model.g.dart';

@entity
@JsonSerializable()
class ParentChatResponse {

  @PrimaryKey(autoGenerate: true)
  int id;
  String Msg;
  String DatePosted;
  String Actor;

  bool sent;
  bool notSent;
  bool sending;


  ParentChatResponse(
    this.id,
    this.Msg,
    this.DatePosted,
    this.Actor,
    this.sent,
    this.notSent,
    this.sending
  );


  factory ParentChatResponse.fromJson(Map<String, dynamic> json) => _$ParentChatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ParentChatResponseToJson(this);
  

  @override
  String toString() {
    return 'ParentChatResponse id: $id, Msg: $Msg, DatePosted: $DatePosted, Actor: $Actor';
  }
}
