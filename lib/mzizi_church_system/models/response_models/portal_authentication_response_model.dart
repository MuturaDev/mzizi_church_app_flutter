
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_authentication_response_model.g.dart';

@entity
@JsonSerializable()
class AuthenticationUserResponse{

   @PrimaryKey(autoGenerate: true)
   int id;
   String UserID;
   String UserType;
   String SchoolID;
   String OrganizationID;

   String AppCode;
   String Username;
   String Password;




  AuthenticationUserResponse(
    this.id,
    this.UserID,
    this.UserType,
    this.SchoolID,
    this.OrganizationID,
    this.AppCode,
    this.Username,
    this.Password
  );

  factory AuthenticationUserResponse.fromJson(Map<String, dynamic> json) => _$AuthenticationUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationUserResponseToJson(this);
    
  @override
  String toString() {
    return 'AuthenticationUserResponse{ UserID: $UserID, UserType: $UserType, SchoolID: $SchoolID, OrganizationID: $OrganizationID, AppCode: $AppCode, Username: $Username, Password: $Password';
  }
}