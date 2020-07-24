import 'package:floor/floor.dart';
import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_siblings_response_model.dart';

class PortalSiblingsDAO {
  PortalSiblingsDAO();

  Future<List<int>> insertPortalSiblings(List<PortalSiblings> insert) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalSiblingsDBDao
          .insertPortalSiblingsResponse(insert);
    } catch (e) {
      throw (e);
    }
  }

  @transaction
  Future<List<PortalSiblings>> getPortalSiblings() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalSiblingsDBDao.getPortalSiblingsoResponse();
    } catch (e) {
      throw (e);
    }
  }

  Future<int> deletePortalSiblings(List<PortalSiblings> response) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return db.getPortalSiblingsDBDao.deletePortalSiblingsResponse(response);
    } catch (e) {
      throw (e);
    }
  }
}
