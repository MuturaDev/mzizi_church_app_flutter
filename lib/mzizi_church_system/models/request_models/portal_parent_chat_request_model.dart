

import 'package:json_annotation/json_annotation.dart';

part 'portal_parent_chat_request_model.g.dart';

@JsonSerializable()
class PortalParentChatRequest {

  String studentID;
  String Msg;
  String staffID;
  String appCode;
 String enquiryTypeID;

  PortalParentChatRequest(
    this.studentID,
    this.Msg,
    this.staffID,
    this.appCode,
    this.enquiryTypeID,
  );

  factory PortalParentChatRequest.fromJson(Map<String, dynamic> json) => _$PortalParentChatRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PortalParentChatRequestToJson(this);

  @override
  String toString() {
    return 'PortalParentChatRequest studentID: $studentID, Msg: $Msg, staffID: $staffID, appCode: $appCode, enquiryTypeID: $enquiryTypeID';
  }
}
