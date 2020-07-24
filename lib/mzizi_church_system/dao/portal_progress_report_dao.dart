import 'package:floor/floor.dart';
import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/progress_report_activities_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/prorgress_report_learning_area_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_progress_report_response_model.dart';

class PortalProgressReportDAO {
  PortalProgressReportDAO();

  Future<List<int>> insertPortalProgressReport(
      List<PortalProgressReport> insert) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalProgressReportDBDao
          .insertPortalProgressReportResponse(insert);
    } catch (e) {
      throw (e);
    }
  }

  Future<List<PortalProgressReport>> getPortalProgressReport() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalProgressReportDBDao
          .getPortalProgressReportResponse();
    } catch (e) {
      throw (e);
    }
  }

  Future<List<String>> getHeadTeacherComments(
      String term, String year, String examType) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      List<PortalProgressReport> comments = await db
          .getPortalProgressReportDBDao
          .getHeadTeacherComment(examType, term, year);

      List<String> headComments = new List();
      for (PortalProgressReport comment in comments) {
        headComments.add(comment.HeadTeacherComment);
      }

      return headComments;
    } catch (e) {
      throw (e);
    }
  }

  Future<List<String>> getClassTeacherComments(
      String term, String year, String examType) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      List<PortalProgressReport> comments = await db
          .getPortalProgressReportDBDao
          .getGradeFacilitatorComment(examType, term, year);

      List<String> classtComments = new List();
      for (PortalProgressReport comment in comments) {
        classtComments.add(comment.ClassTeacherComment);
      }
      return classtComments;
    } catch (e) {
      throw (e);
    }
  }

  Future<int> deletePortalProgressReport(
      List<PortalProgressReport> delete) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return db.getPortalProgressReportDBDao
          .deletePortalProgressReportResponse(delete);
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deleteAllPortalProgressReport() async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return db.getPortalProgressReportDBDao
          .deleteAllPortalProgressReportResponse();
    } catch (e) {
      throw (e);
    }
  }

  @transaction
  Future<List<Activities>> getPortalProgressResultsForYearTermExamType(
      String term, String year, String examType) async {
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();

      List<PortalProgressReport> activityProgress = await db
          .getPortalProgressReportDBDao
          .getActivitiesSelectedYearTermExamType(examType, year, term);

        //This was for testing purposes,,,
      // List<PortalProgressReport> activityProgress = await db
      //     .getPortalProgressReportDBDao
      //     .getActivitiesSelectedYearTermExamType('End Term Exam','2018','Term 2');//, '2018''Term 2'

      List<Activities> activityList = new List();
      for (PortalProgressReport activitys in activityProgress) {

        List<PortalProgressReport> learningAreasProgress = await db
            .getPortalProgressReportDBDao
            .getPortalProgressReportSelectedYearTermExamType(
                activitys.Activity, examType,year,term);//activitys.Activity)// term, year,

        List<LearningAreas> learningAreaList = new List();
        for (PortalProgressReport learningAreas in learningAreasProgress) {
          LearningAreas learningArea = new LearningAreas(
              learningAreas.LearningArea,
              learningAreas.ScoreDescription,
              learningAreas.Remarks);
          learningAreaList.add(learningArea);
        }

        Activities activity = new Activities(activitys.Activity,
            activitys.CourseName, activitys.LevelName, learningAreaList);

        activityList.add(activity);
      }

      return activityList;
    } catch (e) {
      throw (e);
    }
  }

  Future<List<String>> getPortalProgressReportYearFor() async {
    List<String> years = new List();
    years.add("Select year");
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      List<PortalProgressReport> list =
          await db.getPortalProgressReportDBDao.getDistictYears();
      for (PortalProgressReport att in list) {
        years.add(att.YearID);
      }
    } catch (e) {
      throw (e);
    }

    return years;
  }

  Future<List<String>> getPortalProgressReportTermFor() async {
    List<String> terms = new List();
    terms.add("Select term");
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      List<PortalProgressReport> list =
          await db.getPortalProgressReportDBDao.getDistictTerms();
      for (PortalProgressReport att in list) {
        terms.add(att.TermName);
      }
    } catch (e) {
      throw (e);
    }
    return terms;
  }

  Future<List<String>> getPortalProgressReportExamType() async {
    List<String> examType = new List();
    examType.add("Select Examtype");
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      List<PortalProgressReport> list =
          await db.getPortalProgressReportDBDao.getDistictExamType();
      for (PortalProgressReport att in list) {
        examType.add(att.ExamTypeDesc);
      }
    } catch (e) {
      throw (e);
    }
    return examType;
  }
}
