
import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_detailed_results_response_model.dart';

class PortalStudentDetailedResultsDAO {
  PortalStudentDetailedResultsDAO();

  Future<List<int>> insertPortalStudentDetailedResults(
      List<PortalStudentDetailedResults> insert) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalPortalStudentDetailedResultsDBDao
          .insertPortalStudentDetailedResultsResponse(insert);
    } catch (e) {
      throw (e);
    }
  }

  Future<List<PortalStudentDetailedResults>>
      getPortalStudentDetailedResults() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      List<PortalStudentDetailedResults> returnList = await db.getPortalPortalStudentDetailedResultsDBDao
          .getPortalStudentDetailedResultsResponse();

      for(PortalStudentDetailedResults results1 in returnList){
        results1.Subjects = results1.Subjects == null ? "" : results1.Subjects;
        results1.Score = results1.Score == null ? "" : results1.Score;
        results1.Grade= results1.Grade == null ? "" : results1.Grade;
        results1.Remark= results1.Remark == null ? "" : results1.Remark;
        results1.TotalMarks= results1.TotalMarks == null ? "" : results1.TotalMarks;
        results1.MeanScore= results1.MeanScore == null ? "" : results1.MeanScore;
        results1.MeanGrade= results1.MeanGrade == null ? "" : results1.MeanGrade;
        results1.StreamPosition= results1.StreamPosition == null ? "" : results1.StreamPosition;
        results1.OverallPosition= results1.OverallPosition == null ? "" : results1.OverallPosition;
        results1.Period= results1.Period == null ? "" : results1.Period;
        results1.TermName= results1.TermName == null ? "" : results1.TermName;
        results1.CurrentYear= results1.CurrentYear == null ? "" : results1.CurrentYear;
        results1.CTComments= results1.CTComments == null ? "" : results1.CTComments;
        results1.HMComments= results1.HMComments == null ? "" : results1.HMComments;
      }

      return returnList;

    } catch (e) {
      throw (e);
    }
  }

  Future<List<String>> getDistinctYears() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();

      List<String> distictYears = new List();

      List<PortalStudentDetailedResults> resultsList = await db
          .getPortalPortalStudentDetailedResultsDBDao
          .getDistinctYears();
      for (PortalStudentDetailedResults result in resultsList) {
        distictYears.add(result.CurrentYear);
      }

      return distictYears;
    } catch (e) {
      throw (e);
    }
  }

  Future<int> deletePortalStudentDetailedResults(
      List<PortalStudentDetailedResults> delete) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return db.getPortalPortalStudentDetailedResultsDBDao
          .deletePortalStudentDetailedResultsResponse(delete);
    } catch (e) {
      throw (e);
    }
  }
}
