// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenicate_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutheticateUser _$AutheticateUserFromJson(Map<String, dynamic> json) {
  return AutheticateUser(json['AppCode'] as String, json['Username'] as String,
      json['Password'] as String);
}

Map<String, dynamic> _$AutheticateUserToJson(AutheticateUser instance) =>
    <String, dynamic>{
      'AppCode': instance.AppCode,
      'Username': instance.Username,
      'Password': instance.Password
    };
