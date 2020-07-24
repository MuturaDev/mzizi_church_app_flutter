
import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_authentication_response_model.dart';

class AuthenticateUserDAO {
  AuthenticateUserDAO();

  Future<List<int>> insertUser(List<AuthenticationUserResponse> users) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getAuthenticationUserResponseDBDao
          .insertAuthenticationUserResponse(users);
    } catch (e) {
      throw (e);
    }
  }

  Future<int> updateUser(List<AuthenticationUserResponse> users) async {
    try {
      final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getAuthenticationUserResponseDBDao.updateAuthenticationUserResponse(users);
    } catch (e) {
      throw (e);
    }
  }

  Future<List<AuthenticationUserResponse>> getUser() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getAuthenticationUserResponseDBDao
          .getAuthenticationUserResponse();
    } catch (e) {
      throw (e);
    }
  }

  Future<Student> getStudent() async {
    AuthenticateUserDAO dao = new AuthenticateUserDAO();

    Student student;

    List<AuthenticationUserResponse> studentDetails = await dao.getUser();

    if (studentDetails != null) {
      if (studentDetails.isNotEmpty) {
        AuthenticationUserResponse authStudent = studentDetails[0];

        return new Student(authStudent.UserID, authStudent.AppCode);
      }
    }

    return student;
  }

  Future<int> deleteUser(List<AuthenticationUserResponse> users) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getAuthenticationUserResponseDBDao
          .deleteAuthenticationUserResponse(users);
    } catch (e) {
      throw (e);
    }
  }
}
