import 'package:floor/floor.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/app_notification_count.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/mzizi_app_version_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_authentication_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_contacts_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_detailed_todo_list_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_events_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_fee_transaction_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_filtered_student_info_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_notification_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_parent_chat_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_progress_report_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_recent_transaction_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_siblings_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_detailed_results_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_info_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_results_extended_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_visualization_average_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_visualization_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_sync_myaccount_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_to_do_list_response.dart';


@dao
abstract class AuthenticationUserResponseDBDao {
  @Query('SELECT * FROM AuthenticationUserResponse')
  Future<List<AuthenticationUserResponse>> getAuthenticationUserResponse();

  @insert
  Future<List<int>> insertAuthenticationUserResponse(
      List<AuthenticationUserResponse> response);

  @update
  Future<int> updateAuthenticationUserResponse(
      List<AuthenticationUserResponse> response);

  @delete
  Future<int> deleteAuthenticationUserResponse(
      List<AuthenticationUserResponse> deleteResponses);

  @Query('DELETE FROM AuthenticationUserResponse')
  Future<void> deleteAllAuthenticationUserResponse();
}

@dao
abstract class MziziAppVersionDBDao {
  @Query('SELECT * FROM MziziAppVersion')
  Future<List<MziziAppVersion>> getMziziAppVersionResponse();

  @insert
  Future<List<int>> insertMziziAppVersionResponse(
      List<MziziAppVersion> response);

  @delete
  Future<int> deleteMziziAppVersionResponse(List<MziziAppVersion> response);

  @Query('DELETE FROM MziziAppVersion')
  Future<void> deleteAllMziziAppVersion();
}

@dao
abstract class PortalContactsDBDao {
  @Query('SELECT * FROM PortalContacts')
  Future<List<PortalContacts>> getPortalContactsResponse();

  @insert
  Future<List<int>> insertPortalContactsResponse(List<PortalContacts> response);

  @delete
  Future<int> deletePortalContactsResponse(List<PortalContacts> response);

  @Query('DELETE FROM PortalContacts')
  Future<void> deleteAllPortalContacts();
}

@dao
abstract class PortalDetailedTransactionDBDao {
  @Query('SELECT * FROM PortalDetailedTransaction')
  Future<List<PortalDetailedTransaction>> getPortalDetailedTransaction();

  @insert
  Future<List<int>> insertPortalDetailedTransactionResponse(
      List<PortalDetailedTransaction> response);

  @delete
  Future<int> deletePortalDetailedTransactionResponse(
      List<PortalDetailedTransaction> response);

  @Query('DELETE FROM PortalDetailedTransaction')
  Future<void> deleteAllPortalDetailedTransaction();
}

@dao
abstract class PortalFilteredStudentInfoDBDao {
  @Query('SELECT * FROM PortalFilteredStudentInfo')
  Future<List<PortalFilteredStudentInfo>>
      getPortalFilteredStudentInfoResponse();

  @insert
  Future<List<int>> insertPortalFilteredStudentInfoResponse(
      List<PortalFilteredStudentInfo> response);

  @delete
  Future<int> deletePortalFilteredStudentInfoResponse(
      List<PortalFilteredStudentInfo> response);

  @Query('DELETE FROM PortalFilteredStudentInfo')
  Future<void> deleteAllPortalFilteredStudentInfo();
}

@dao
abstract class PortalNotificationDBDao {
  @Query('SELECT * FROM PortalNotification')
  Future<List<PortalNotification>> getPortalNotificationResponse();

  @Query('SELECT * FROM PortalNotification ORDER BY id DESC LIMIT 1')
  Future<List<PortalNotification>> getLastNotificationResponse();

  @insert
  Future<List<int>> insertPortalNotificationResponse(
      List<PortalNotification> response);

  @delete
  Future<int> deletePortalNotificationResponse(
      List<PortalNotification> response);

  @Query('DELETE FROM PortalNotification')
  Future<void> deleteAllPortalNotification();
}

@dao
abstract class PortalProgressReportDBDao {
  @Query('SELECT * FROM PortalProgressReport')
  Future<List<PortalProgressReport>> getPortalProgressReportResponse();

  //dont leave spaces between the sqp arguments, raises errors if done, it should be :examType not : examType
  //FIXME: This was was fixed by the next line
  // @Query('SELECT  Activity, CourseName, LevelName FROM PortalProgressReport WHERE ExamTypeDesc = :examType AND YearID = :yearFor AND TermName = :termName')
  // Future<List<PortalProgressReport>> getActivitiesSelectedYearTermExamType(String examType, String termName, String yearFor);

  @Query(
      'SELECT DISTINCT Activity, CourseName, LevelName FROM PortalProgressReport WHERE ExamTypeDesc = :examType AND YearID = :yearFor AND TermName = :termName') //
  Future<List<PortalProgressReport>> getActivitiesSelectedYearTermExamType(
      String examType,
      String yearFor,
      String termName); //, String termName, String yearFor

  @Query(
      'SELECT DISTINCT LearningArea, ScoreDescription, Remarks FROM PortalProgressReport WHERE  Activity = :activity AND ExamTypeDesc = :examType AND YearID = :yearFor AND TermName = :termName') // AND AND YearID = :yearFor AND TermName = :termName
  Future<List<PortalProgressReport>>
      getPortalProgressReportSelectedYearTermExamType(
          String activity,
          String examType,
          String yearFor,
          String termName); // , String termName, String yearFor,

  @Query(
      'SELECT DISTINCT HeadTeacherComment FROM PortalProgressReport WHERE ExamTypeDesc = :examType AND YearID = :yearFor AND TermName = :termName')
  Future<List<PortalProgressReport>> getHeadTeacherComment(
      String examType, String termName, String yearFor);

  @Query(
      'SELECT DISTINCT ClassTeacherComment FROM PortalProgressReport WHERE ExamTypeDesc = :examType AND YearID = :yearFor AND TermName = :termName')
  Future<List<PortalProgressReport>> getGradeFacilitatorComment(
      String examType, String termName, String yearFor);

  @Query('SELECT DISTINCT YearID FROM PortalProgressReport')
  Future<List<PortalProgressReport>> getDistictYears();

  @Query('SELECT DISTINCT TermName FROM PortalProgressReport')
  Future<List<PortalProgressReport>> getDistictTerms();

  @Query('SELECT DISTINCT ExamTypeDesc  FROM PortalProgressReport')
  Future<List<PortalProgressReport>> getDistictExamType();

  @insert
  Future<List<int>> insertPortalProgressReportResponse(
      List<PortalProgressReport> response);

  @delete
  Future<int> deletePortalProgressReportResponse(
      List<PortalProgressReport> response);

  @Query('DELETE FROM PortalProgressReport')
  Future<void> deleteAllPortalProgressReportResponse();
}

@dao
abstract class PortalSiblingsDBDao {
  @Query('SELECT DISTINCT StudentID,RegistrationNumber, StudentFullName,CourseName,StudentStatus FROM PortalSiblings')
  Future<List<PortalSiblings>> getPortalSiblingsoResponse();

  @insert
  Future<List<int>> insertPortalSiblingsResponse(List<PortalSiblings> response);

  @Query('DELETE FROM PortalSiblings')
  Future<void> deleteAllPortalPortalSiblings();

  @delete
  Future<int> deletePortalSiblingsResponse(List<PortalSiblings> response);
}

// @dao
// abstract class PortalStudentClassAttendanceDBDao {
//   @Query('SELECT * FROM PortalStudentClassAttendance')
//   Future<List<PortalStudentClassAttendance>>
//       getPortalStudentClassAttendanceResponse();

//   @Query(
//       'SELECT * FROM PortalStudentClassAttendance WHERE  TermFor = :term  AND YearFor = :year')
//   Future<List<PortalStudentClassAttendance>>
//       getPortalStudentClassAttendanceForSelectedTermYear(
//           String term, String year);

//   @insert
//   Future<List<int>> insertPortalStudentClassAttendanceResponse(
//       List<PortalStudentClassAttendance> response);

//   @Query('SELECT DISTINCT YearFor FROM PortalStudentClassAttendance')
//   Future<List<PortalStudentClassAttendance>> getDistictYears();

//   @Query('SELECT DISTINCT TermFor FROM PortalStudentClassAttendance')
//   Future<List<PortalStudentClassAttendance>> getDistictTerms();

//   @Query('DELETE FROM PortalStudentClassAttendance')
//   Future<void> deleteAllStudentClassAttendance();

//   @delete
//   Future<int> deletePortalStudentClassAttendanceResponse(
//       List<PortalStudentClassAttendance> response);
// }

@dao
abstract class PortalStudentDetailedResultsDBDao {
  @Query('SELECT * FROM PortalStudentDetailedResults')
  Future<List<PortalStudentDetailedResults>>
      getPortalStudentDetailedResultsResponse();

  @Query('SELECT DISTINCT CurrentYear FROM PortalStudentDetailedResults')
  Future<List<PortalStudentDetailedResults>> getDistinctYears();

  @insert
  Future<List<int>> insertPortalStudentDetailedResultsResponse(
      List<PortalStudentDetailedResults> response);

  @delete
  Future<int> deletePortalStudentDetailedResultsResponse(
      List<PortalStudentDetailedResults> response);

  @Query('DELETE FROM PortalStudentDetailedResults')
  Future<void> deleteAllPortalStudentDetailedResults();
}

@dao
abstract class PortalStudentInfoDBDao {
  @Query('SELECT * FROM PortalStudentInfo')
  Future<List<PortalStudentInfo>> getPortalStudentInfoResponse();

  @insert
  Future<List<int>> insertPortalStudentInfoResponse(
      List<PortalStudentInfo> response);

  @delete
  Future<int> deletePortalStudentInfoResponse(List<PortalStudentInfo> response);

  @Query('DELETE FROM PortalStudentInfo')
  Future<void> deleteAllPortalStudentInfo();
}

@dao
abstract class PortalSyncMyAccountDBDao {
  @Query('SELECT * FROM PortalSyncMyAccount')
  Future<List<PortalSyncMyAccount>> getPortalSyncMyAccountResponse();

  @insert
  Future<List<int>> insertPortalSyncMyAccountResponse(
      List<PortalSyncMyAccount> response);


  @Query('DELETE FROM PortalSyncMyAccount')
  Future<void> deleteAllPortalSyncMyAccount();
}

@dao
abstract class PortalEventsDBDao {
  @Query('SELECT * FROM PortalEvents')
  Future<List<PortalEvents>> getPortalEventsResponse();

  @insert
  Future<List<int>> insertPortalEventsResponse(List<PortalEvents> response);

  @delete
  Future<int> deletePortalEventsResponse(List<PortalEvents> response);

  @Query('DELETE FROM PortalEvents')
  Future<void> deleteAllPortalEvents();
}

@dao
abstract class AppNotificationCountDBDao {
  @Query('SELECT * FROM AppNotificationCount')
  Future<List<AppNotificationCount>> getAppNotificationCountResponse();

  //find out why this aint working
  // @Query('SELECT COUNT(MsgID) FROM AppNotificationCount')
  // Future<int> getAppNotificationCount();

  @insert
  Future<List<int>> insertAppNotificationCountResponse(
      List<AppNotificationCount> response);

  @delete
  Future<int> deleteAppNotificationCountResponse(
      List<AppNotificationCount> response);

  @Query('DELETE FROM AppNotificationCount')
  Future<void> deleteAllAppNotificationCount();
}


@dao
abstract class ParentChatResponseDBDao{
  @Query('SELECT DISTINCT Msg, DatePosted, Actor, sent,notSent, sending FROM ParentChatResponse')
  Future<List<ParentChatResponse>> getParentChatResponse();

  @Query('SELECT DISTINCT Msg, DatePosted, Actor, sent,notSent, sending FROM ParentChatResponse')
  Stream<List<ParentChatResponse>> getParentChatResponseStream();

  @insert
  Future<List<int>> insertParentChatResponse(
    List<ParentChatResponse> response
  );

  @Query('DELETE FROM ParentChatResponse WHERE Msg = :message')
Future<void> deleteOneParentChatResponse(String message);

  @Query('DELETE FROM ParentChatResponse')
  Future<void> deleteParentChatResponse();
}


@dao
abstract class PortalRecentTransactionsDBDao{
  @Query('SELECT * FROM PortalRecentTransaction')
  Future<List<PortalRecentTransaction>> getPortalRecentTransactions();

  @insert
  Future<List<int>> insertPortalRecentTransactions(List<PortalRecentTransaction> response);

  @Query('DELETE FROM PortalRecentTransaction')
  Future<void> deletePortalRecentTransactions();
}

@dao
abstract class PortalTodoListDBDao{
  @Query('SELECT * FROM PortalToDoList')
  Future<List<PortalToDoList>> getPortalTodoLists();

  @insert
  Future<List<int>> insertPortalTodoLists(List<PortalToDoList> response);

  @Query('DELETE FROM PortalToDoList')
  Future<void> deletePortalToDoLists();
  
}

@dao
abstract class PortalDetailedTodoListDBDao{
  @Query('SELECT * FROM PortalDetailedTodoList')
  Future<List<PortalDetailedTodoList>> getPortalDetailedTodoList();

  @insert
  Future<List<int>> insertPortalDetailedTodoLists(List<PortalDetailedTodoList> response);

  @Query('DELETE FROM PortalDetailedTodoList')
  Future<void> deletePortalDetailedTodoList();
  
}


@dao
abstract class PortalStudentVisualizationDBDao{
  @Query('SELECT * FROM PortalStudentVisualization')
  Future<List<PortalStudentVisualization>> getPortalStudentVisualization();

  @insert
  Future<List<int>> insertPortalStudentVisualization(List<PortalStudentVisualization> response);

  @Query('DELETE FROM PortalStudentVisualization')
  Future<void> deletePortalStudentVisualization();
  
}

@dao
abstract class PortalStudentVisualizationAverageDBDao{
  @Query('SELECT * FROM PortalStudentVisualizationAverage')
  Future<List<PortalStudentVisualizationAverage>> getPortalStudentVisualizationAverage();

  @insert
  Future<List<int>> insertPortalStudentVisualizationAverage(List<PortalStudentVisualizationAverage> response);

  @Query('DELETE FROM PortalStudentVisualizationAverage')
  Future<void> deletePortalStudentVisualizationAverage();
  
}


@dao
abstract class PortalStudentResultsExtendedDBDao{
  @Query('SELECT * FROM PortalStudentResultsExtended')
  Future<List<PortalStudentResultsExtended>> getPortalStudentResultsExtended();

  @insert
  Future<List<int>> insertPortalStudentResultsExtended(List<PortalStudentResultsExtended> response);

  @Query('DELETE FROM PortalStudentResultsExtended')
  Future<void> deletePortalStudentResultsExtended();
  
}






