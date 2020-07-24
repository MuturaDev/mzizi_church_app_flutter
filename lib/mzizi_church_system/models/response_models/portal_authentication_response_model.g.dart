// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_authentication_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationUserResponse _$AuthenticationUserResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticationUserResponse(
      json['id'] as int,
      json['UserID'] as String,
      json['UserType'] as String,
      json['SchoolID'] as String,
      json['OrganizationID'] as String,
      json['AppCode'] as String,
      json['Username'] as String,
      json['Password'] as String);
}

Map<String, dynamic> _$AuthenticationUserResponseToJson(
        AuthenticationUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'UserID': instance.UserID,
      'UserType': instance.UserType,
      'SchoolID': instance.SchoolID,
      'OrganizationID': instance.OrganizationID,
      'AppCode': instance.AppCode,
      'Username': instance.Username,
      'Password': instance.Password
    };
