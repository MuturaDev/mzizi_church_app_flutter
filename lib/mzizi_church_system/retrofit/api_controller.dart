import 'package:dio/dio.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/authenicate_user_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/mzizi_app_version_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/portal_notification_read_tracking_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/portal_notification_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/portal_parent_chat_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/portal_student_class_attendance_request_model.dart';
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
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api.dart';



class ApiController {
//check for errors and display them kwa ui
//try{}catch(e){}
  static Future<dynamic> sendRequestToAuthenticateUser(
      AutheticateUser user) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<AuthenticationUserResponse> authUserList = new List();

    await _client
        .apiGetAuthenticationUserResponse(user.toJson())
        .then((response) {
      authUserList.add(response);
    }).catchError((Object ob) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForPortalDetailedTransactions(
      Student student) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalDetailedTransaction> authUserList = new List();

    await _client
        .apiGetPortalDetailedTransactions(student.toJson())
        .then((response) {
      authUserList.addAll(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForFIlteredStudentInfo(
      Student student) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalFilteredStudentInfo> authUserList = new List();

    await _client.apiGetFilteredStudentInfo(student.toJson()).then((response) {
      authUserList.add(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForSyncMyAccount(Student student) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalSyncMyAccount> authUserList = new List();

    await _client.apiGetSyncMyAccount(student.toJson()).then((response) {
      authUserList.add(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForPortalNotificationsReadTracking(
      PortalNotificationReadTracking notificationReadTracking) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<String> authUserList = new List();

    await _client
        .apiGetPortalNotificationsReadTracking(
            notificationReadTracking.toJson())
        .then((response) {
      authUserList.add(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForMziziAppVersion(
      MziziAppVersionRequest version) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<MziziAppVersion> authUserList = new List();

    await _client.apiGetMziziAppVersion(version.toJson()).then((response) {
      authUserList.add(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForPortalContacts(Student student) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalContacts> authUserList = new List();

    await _client.apiGetPortalContacts(student.toJson()).then((response) {
      authUserList.addAll(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForPortalEvents(Student student) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalEvents> authUserList = new List();

    await _client.apiGetPortalEvents(student.toJson()).then((response) {
      authUserList.addAll(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForPortalNotifications(
      PortalNotificationRequest notification) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalNotification> authUserList = new List();

    await _client
        .apiGetPortalNotifications(notification.toJson())
        .then((response) {
      authUserList.addAll(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForPortalSiblings(Student student) async {
    try {
      final Dio dio = Dio(); // Provide a dio instance
      dio.options.headers["Content-Type"] = "application/json";
      final _client = RestClient(dio);

      final List<PortalSiblings> authUserList = new List();

      await _client.apiGetPortalSiblings(student.toJson()).then((response) {
        authUserList.addAll(response);
      }).catchError((Object obj) {
        return authUserList;
      });
      return authUserList;
    } catch (e) {
      throw (e);
    }
  }

  static Future<dynamic> sendRequestForPortalStudentDetailesResults(
      Student student) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalStudentDetailedResults> authUserList = new List();

    await _client
        .apiGetPortalStudentDetailedResults(student.toJson())
        .then((response) {
      authUserList.addAll(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForportalStudentInfo(
      Student student) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalStudentInfo> authUserList = new List();

    await _client.apiGetPortalStudentInfo(student.toJson()).then((response) {
      authUserList.add(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForPortalGetProgressReport(
      Student student) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalProgressReport> authUserList = new List();

    await _client
        .apiGetPortalGetProgressReport(student.toJson())
        .then((response) {
      authUserList.addAll(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  // static Future<dynamic> sendRequestForPortalStudentAttendance(
  //     PortalStudentClassRequest attendance) async {
  //   //try{
  //   final Dio dio = Dio(); // Provide a dio instance
  //   dio.options.headers["Content-Type"] = "application/json";
  //   final _client = RestClient(dio);

  //   final List<PortalStudentClassAttendance> authUserList = new List();

  //   await _client
  //       .apiGetPortalParentStudentAttendance(attendance.toJson())
  //       .then((response) {
  //     authUserList.addAll(response);
  //   }).catchError((Object obj) {
  //     return authUserList;
  //   });
  //   return authUserList;
  //   // }catch(e){
  //   //   throw(e);
  //   // }
  // }

  static Future<dynamic> sendRequestForPortalParentChats(
      PortalParentChatRequest request) async {
    //try{
    final Dio dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<ParentChatResponse> authUserList = new List();

    await _client.apiGetPortalParentsChat(request.toJson()).then((response) {
      authUserList.addAll(response);
    }).catchError((Object obj) {
      return authUserList;
    });
    return authUserList;
    // }catch(e){
    //   throw(e);
    // }
  }

  static Future<dynamic> sendRequestForPortalToDoList(
      final Student request) async {
    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalToDoList> responseList = new List();

    await _client.apiGetPortalToDoList(request.toJson()).then((response) {
      responseList.addAll(response);
    }).catchError((Object obj) {
      return responseList;
    });
    return responseList;
  }

  static Future<dynamic> sendRequestForPortalDetailedToDoList(
      final Student request) async {
    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalDetailedTodoList> responseList = new List();

    await _client
        .apiGetPortalDetailedToDoList(request.toJson())
        .then((response) {
      responseList.addAll(response);
    }).catchError((Object obj) {
      return responseList;
    });
    return responseList;
  }

  static Future<dynamic> sendRequestForPortalRecentTransaction(final Student request)async{
    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalRecentTransaction> responseList = new List();

    await _client.apiGetPortalRecentTransactions(request.toJson()).then((response) {
      responseList.addAll(response);
    }).catchError((Object obj) {
      return responseList;
    });
    return responseList;
  }

  static Future<dynamic> sendRequestForPortalStudentVisualization(final Student request)async{
     final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalStudentVisualization> responseList = new List();

    await _client.apiGetPortalStudentVisualization(request.toJson()).then((response) {
      responseList.addAll(response);
    }).catchError((Object obj) {
      return responseList;
    });
    return responseList;
  }


  static Future<dynamic> sendRequestForPortalStudentVisualizationAverage(final Student request)async{
    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalStudentVisualizationAverage> responseList = new List();

    await _client.apiGetPortalStudentVisualizationAverage(request.toJson()).then((response) {
      responseList.addAll(response);
    }).catchError((Object obj) {
      return responseList;
    });
    return responseList;
  }

  static Future<dynamic> sendRequestForPortalStudentResultsExtended(final Student request)async{
    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalStudentResultsExtended> responseList = new List();

    await _client.apiGetPortalStudentResultsExtended(request.toJson()).then((response){
        responseList.addAll(response);
    }).catchError((Object obj){
      return responseList;
    });
    return responseList;
  }

}
