


import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_to_do_list_response.dart';

class PortalTodoListDAO{

  PortalTodoListDAO();
Future<List<int>> insertPortalTodoList(
      List<PortalToDoList> insert) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalTodoListDBDao
          .insertPortalTodoLists(insert);
    } catch (e) {
      throw (e);
    }
  }

  Future<List<PortalToDoList>> getPortalToDoLists() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalTodoListDBDao
          .getPortalTodoLists();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deletePortalToDoLists() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return db.getPortalTodoListDBDao.deletePortalToDoLists();
    } catch (e) {
      throw (e);
    }
  }
}