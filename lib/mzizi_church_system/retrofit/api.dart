

import 'package:dio/dio.dart';
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




import 'package:retrofit/retrofit.dart';


part 'api.g.dart';

//@RestApi(baseUrl: "https://taapi.mzizi.co.ke/api")//THIS IS FOR TESTING
@RestApi(baseUrl: "https://api-church.mzizi.co.ke/api")//old
//@RestApi(baseUrl: "https://androidv2.mzizi.co.ke/api")//new
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;


  @POST("/UserCredentials")
  Future<AuthenticationUserResponse>apiGetAuthenticationUserResponse(@Body() Map<String,dynamic> request);

  @POST("/PortalDetailedTransaction")
  Future<List<PortalDetailedTransaction>> apiGetPortalDetailedTransactions(@Body() Map<String,dynamic> request); 

  @POST("/FilteredStudentInfo")
  Future<PortalFilteredStudentInfo> apiGetFilteredStudentInfo(@Body() Map<String,dynamic> request); 

  @POST("/SyncMyAccount")
  Future<PortalSyncMyAccount> apiGetSyncMyAccount(@Body() Map<String,dynamic> request); 

  @POST("/PortalNotificationsReadTracking")
  Future<String> apiGetPortalNotificationsReadTracking(@Body() Map<String,dynamic> request); 


  @POST("/PortalGetGlobalSettings")
  Future<String> apiGetPortalGlobalSettings(@Body() Map<String,dynamic> request); 

  @POST("/MziziAppVersion")
  Future<MziziAppVersion> apiGetMziziAppVersion(@Body() Map<String,dynamic> request); 

  @POST("/PortalContacts")
  Future<List<PortalContacts>> apiGetPortalContacts(@Body() Map<String,dynamic> request); 

  @POST("/PortalEvents")
  Future<List<PortalEvents>> apiGetPortalEvents(@Body() Map<String,dynamic> request); 

  @POST("/PortalNotifications")
  Future<List<PortalNotification>> apiGetPortalNotifications(@Body() Map<String,dynamic> request); 

  @POST("/PortalSiblings")
  Future<List<PortalSiblings>> apiGetPortalSiblings(@Body() Map<String,dynamic> request); 

  @POST("/PortalStudentDetailedResults")
  Future<List<PortalStudentDetailedResults>> apiGetPortalStudentDetailedResults(@Body() Map<String,dynamic> request); 

  @POST("/PortalStudentInfo")
  Future<PortalStudentInfo> apiGetPortalStudentInfo(@Body() Map<String,dynamic> request); 

  @POST("/PortalGetProgressReport")
  Future<List<PortalProgressReport>> apiGetPortalGetProgressReport(@Body() Map<String,dynamic> request); 

  // @POST("/ParentPortalStudentAttendance")
  // Future<List<PortalStudentClassAttendance>> apiGetPortalParentStudentAttendance(@Body() Map<String,dynamic> request); 

  //CHATTING
  @POST("/PortalParentChat")
  Future<List<ParentChatResponse>> apiGetPortalParentsChat(@Body() Map<String,dynamic> request); 



//TODO: TO BE DONE LATER
  // @POST("/PortalOptionalFees")
  // Future<List<AuthenticationUserResponse>> apiGetPortalOptionalFees(@Body() Map<String,dynamic> request); 

  //  @POST("/PortalGetTransportRoutes")
  // Future<List<AuthenticationUserResponse>> apiGetPortalGetTransportRoutes(@Body() Map<String,dynamic> request); 

   @POST("/PortalToDoList")
  Future<List<PortalToDoList>> apiGetPortalToDoList(@Body() Map<String,dynamic> request); 

  @POST("/PortalDetailedToDoList")
  Future<List<PortalDetailedTodoList>> apiGetPortalDetailedToDoList(@Body() Map<String, dynamic> request);

  //DETIALED TO TOD LIST

   @POST("/PortalRecentTransactions")
  Future<List<PortalRecentTransaction>> apiGetPortalRecentTransactions(@Body() Map<String,dynamic> request); 

   @POST("/PortalStudentVisualization")
  Future<List<PortalStudentVisualization>> apiGetPortalStudentVisualization(@Body() Map<String,dynamic> request); 

   @POST("/PortalStudentVisualizationAverage")
  Future<List<PortalStudentVisualizationAverage>> apiGetPortalStudentVisualizationAverage(@Body() Map<String,dynamic> request); 

  @POST("/PortalStudentResults")
  Future<List<PortalStudentResultsExtended>> apiGetPortalStudentResultsExtended(@Body() Map<String, dynamic> request);




  

}

