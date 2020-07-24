

import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_detailed_todo_list_response.dart';

class PortalDetailedTodoListDAO{

  PortalDetailedTodoListDAO();

  Future<List<int>> insertPortalDetailedTodoList(
      List<PortalDetailedTodoList> insert) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalDetailedTodoListDBDao
          .insertPortalDetailedTodoLists(insert);
    } catch (e) {
      throw (e);
    }
  }

  Future<List<PortalDetailedTodoList>> getPortalDetailedTodoLists() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalDetailedTodoListDBDao
          .getPortalDetailedTodoList();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deletePortalDetailedTodoLists() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return db.getPortalDetailedTodoListDBDao.deletePortalDetailedTodoList();
    } catch (e) {
      throw (e);
    }
  }

}