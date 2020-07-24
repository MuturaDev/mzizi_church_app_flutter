


import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_visualization_response.dart';

class PortalStudentVisualizationDAO{

  PortalStudentVisualizationDAO();


  Future<List<int>> insertPortalStudentVisualization(
      List<PortalStudentVisualization> insert) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalStudentVisualizationDBDao
          .insertPortalStudentVisualization(insert);
    } catch (e) {
      throw (e);
    }
  }

  Future<List<PortalStudentVisualization>> getPortalStudentVisualization() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalStudentVisualizationDBDao
          .getPortalStudentVisualization();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deletePortalSyncMyAccount() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return db.getPortalStudentVisualizationDBDao.deletePortalStudentVisualization();
    } catch (e) {
      throw (e);
    }
  }

}