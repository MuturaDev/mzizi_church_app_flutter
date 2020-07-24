import 'package:floor/floor.dart';
import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Logout {
  Logout();

  @transaction
  Future<void> logout({bool exceptAuthUser = false}) async {
    final db =
        await $FloorAppDatabase.databaseBuilder("app_database.db").build();
    if (exceptAuthUser)
      await db.getAuthenticationUserResponseDBDao
          .deleteAllAuthenticationUserResponse();
    await db.getMziziAppVersionDBDao.deleteAllMziziAppVersion();
    await db.getPortalContactsDBDao.deleteAllPortalContacts();
    await db.getPortalDetailedTransactionDBDao
        .deleteAllPortalDetailedTransaction();
    await db.getPortalFilteredStudentInfoDBDao
        .deleteAllPortalFilteredStudentInfo();
    await db.getPortalNotificationDBDao.deleteAllPortalNotification();
    await db.getPortalProgressReportDBDao
        .deleteAllPortalProgressReportResponse();
    await db.getPortalSiblingsDBDao.deleteAllPortalPortalSiblings();
    // await db.getPortalStudentClassAttendanceDBDao
    //     .deleteAllStudentClassAttendance();
    await db.getPortalPortalStudentDetailedResultsDBDao
        .deleteAllPortalStudentDetailedResults();
    await db.getPortalStudentInfoDBDao.deleteAllPortalStudentInfo();
    await db.getPortalSyncMyAccountDBDao.deleteAllPortalSyncMyAccount();
    await db.getPortalEventsDBDao.deleteAllPortalEvents();
    await db.getAppNotificationCountDBDao.deleteAllAppNotificationCount();
    await db.getParentChatResponseDBDao.deleteParentChatResponse();
     final pref = await SharedPreferences.getInstance();
     pref.clear();
  }
}
