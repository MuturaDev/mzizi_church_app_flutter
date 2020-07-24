


import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_results_extended_response.dart';

class PortalStudentResultsExtendedDAO{

    PortalStudentResultsExtendedDAO();

    Future<List<int>> insertPortalStudentVisualizationAverage(
      List<PortalStudentResultsExtended> insert) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalStudentResultsExtendedDBDao
          .insertPortalStudentResultsExtended(insert);
    } catch (e) {
      throw (e);
    }
  }

  Future<List<PortalStudentResultsExtended>> getPortalStudentResultsExtended() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalStudentResultsExtendedDBDao
          .getPortalStudentResultsExtended();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deletePortalStudentResultsExtended() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return db.getPortalStudentResultsExtendedDBDao.deletePortalStudentResultsExtended();
    } catch (e) {
      throw (e);
    }
  }

}