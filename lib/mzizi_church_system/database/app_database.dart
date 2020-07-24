

import 'dart:async';
 import 'package:floor/floor.dart';
 import 'package:sqflite/sqflite.dart' as sqflite;
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
import 'database_dao.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;



part 'app_database.g.dart';

@Database(version: 1, entities: [

                                AuthenticationUserResponse,
                                 MziziAppVersion,                            
                                 PortalContacts,
                                 PortalEvents,
                                 PortalDetailedTransaction,
                                 PortalFilteredStudentInfo,
                                 PortalNotification,
                                 PortalProgressReport,
                                 PortalSiblings,
                                
                                 PortalStudentDetailedResults,
                                 PortalStudentInfo,
                                 PortalSyncMyAccount,
                                 AppNotificationCount,
                                 ParentChatResponse,

  
                                 PortalRecentTransaction,
                                 PortalStudentVisualization,
                                 PortalStudentVisualizationAverage,
                                 PortalToDoList,
                                 PortalDetailedTodoList,
                                 PortalStudentResultsExtended
                                 


])
abstract class AppDatabase extends FloorDatabase {
  //v1
  AuthenticationUserResponseDBDao get getAuthenticationUserResponseDBDao;
  MziziAppVersionDBDao get getMziziAppVersionDBDao;
  PortalContactsDBDao get getPortalContactsDBDao;
  PortalDetailedTransactionDBDao get getPortalDetailedTransactionDBDao;
  PortalFilteredStudentInfoDBDao get getPortalFilteredStudentInfoDBDao;
  PortalNotificationDBDao get getPortalNotificationDBDao;
  PortalProgressReportDBDao get getPortalProgressReportDBDao;
  PortalSiblingsDBDao get getPortalSiblingsDBDao;
  
  PortalStudentDetailedResultsDBDao get getPortalPortalStudentDetailedResultsDBDao;
  PortalStudentInfoDBDao get getPortalStudentInfoDBDao;
  PortalSyncMyAccountDBDao get getPortalSyncMyAccountDBDao;
  PortalEventsDBDao get getPortalEventsDBDao;
  AppNotificationCountDBDao getAppNotificationCountDBDao;
  ParentChatResponseDBDao getParentChatResponseDBDao;

  //v2
  PortalRecentTransactionsDBDao getPortalRecentTransactionsDBDao;
  PortalTodoListDBDao getPortalTodoListDBDao;
  PortalDetailedTodoListDBDao getPortalDetailedTodoListDBDao;
  PortalStudentVisualizationDBDao getPortalStudentVisualizationDBDao;
  PortalStudentVisualizationAverageDBDao getPortalStudentVisualizationAverageDBDao;
  PortalStudentResultsExtendedDBDao getPortalStudentResultsExtendedDBDao;

}




