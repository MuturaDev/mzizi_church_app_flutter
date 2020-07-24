


import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_visualization_average_response.dart';

class PortalStudentVisualizationAverageDAO{

  PortalStudentVisualizationAverageDAO();

  Future<List<int>> insertPortalStudentVisualizationAverage(
      List<PortalStudentVisualizationAverage> insert) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalStudentVisualizationAverageDBDao
          .insertPortalStudentVisualizationAverage(insert);
    } catch (e) {
      throw (e);
    }
  }

  Future<List<PortalStudentVisualizationAverage>> getPortalStudentVisualizationAverage() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalStudentVisualizationAverageDBDao
          .getPortalStudentVisualizationAverage();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deletePortalStudentVisualizationAverage() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return db.getPortalStudentVisualizationAverageDBDao.deletePortalStudentVisualizationAverage();
    } catch (e) {
      throw (e);
    }
  }

}