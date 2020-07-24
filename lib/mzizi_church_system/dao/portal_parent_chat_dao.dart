
import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_parent_chat_response_model.dart';

class PortalParentChatDAO {
  PortalParentChatDAO();

  Future<List<int>> insertPortalParentChat(
      List<ParentChatResponse> insert) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getParentChatResponseDBDao
          .insertParentChatResponse(insert);
    } catch (e) {
      throw (e);
    }
  }

  Future<List<ParentChatResponse>> getParentChatResponse() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getParentChatResponseDBDao.getParentChatResponse();
    } catch (e) {
      throw (e);
    }
  }

  Future<AppDatabase> getParentChatResponseStream() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();

      return db;
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deleteParentChatResponse() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getParentChatResponseDBDao.deleteParentChatResponse();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deleteOneParentChatResponse(String message)async{
    try{
        final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getParentChatResponseDBDao.deleteOneParentChatResponse(message);
    }catch(e){
      throw(e);
    }
  }
}
