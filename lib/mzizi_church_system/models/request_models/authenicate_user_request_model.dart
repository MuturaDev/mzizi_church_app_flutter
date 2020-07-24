
import 'package:json_annotation/json_annotation.dart';

part 'authenicate_user_request_model.g.dart';

@JsonSerializable()
 class AutheticateUser{
   
   String AppCode;
   String Username;
   String Password;

   AutheticateUser(this.AppCode, this.Username, this.Password);
  
  factory AutheticateUser.fromJson(Map<String, dynamic> json) => _$AutheticateUserFromJson(json);

  Map<String, dynamic> toJson() => _$AutheticateUserToJson(this);

  @override
  String toString() {
    return 'AutheticateUser{ appcode: $AppCode, username: $Username, password: $Password, this.password): $this.password)';
  }
 }