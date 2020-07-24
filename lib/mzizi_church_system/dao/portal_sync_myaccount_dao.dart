
import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_sync_myaccount_response_model.dart';

class PortalSyncMyAccountDAO {
  PortalSyncMyAccountDAO();

  Future<List<int>> insertPortalSyncMyAccount(
      List<PortalSyncMyAccount> insert) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalSyncMyAccountDBDao
          .insertPortalSyncMyAccountResponse(insert);
    } catch (e) {
      throw (e);
    }
  }

  Future<List<PortalSyncMyAccount>> getPortalSyncMyAccount() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalSyncMyAccountDBDao
          .getPortalSyncMyAccountResponse();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deletePortalSyncMyAccount() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return db.getPortalSyncMyAccountDBDao.deleteAllPortalSyncMyAccount();
    } catch (e) {
      throw (e);
    }
  }
}
