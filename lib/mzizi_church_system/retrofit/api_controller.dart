import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dummy_json_test/dummy_json.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_notification_message.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/authenicate_user_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/mzizi_app_version_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/portal_notification_read_tracking_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/portal_notification_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/portal_parent_chat_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/portal_student_class_attendance_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/charge_type_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/mzizi_app_version_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_app_get_portal_photo_gallery.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_authentication_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_church_services_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_contacts_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_detailed_todo_list_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_events_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_fee_transaction_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_filtered_student_info_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_member_profile_model.dart';
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
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_video_gallery_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/service_types_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api.dart';
import 'package:retrofit/retrofit.dart';

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

  static Future<dynamic> sendRequestForPortalEvents() async {
    Student request = await AuthenticateUserDAO().getStudent();

    // final Dio dio = Dio(); // Provide a dio instance
    // dio.options.headers["Content-Type"] = "application/json";
    // final _client = RestClient(dio);

    // final List<PortalEvents> authUserList = new List();

    // await _client.apiGetPortalEvents(request.toJson()).then((response) {
    //   authUserList.addAll(response);
    // }).catchError((Object obj) {
    //   return authUserList;
    // });
    // return authUserList;

    dynamic data = await _getDummyEvents();
    return data;
  }

  static dynamic _getDummyEvents() {
    final List<PortalEvents> responseList = new List();
    for (Map<String, dynamic> outerMap in events) {
      var eventObj = PortalEvents.fromJson(outerMap);
      responseList.add(eventObj);
    }

    return responseList;
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

  static Future<dynamic> sendRequestForPortalDetailedToDoList() async {
    Student request = await AuthenticateUserDAO().getStudent();
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

  static Future<dynamic> sendRequestForPortalRecentTransaction(
      final Student request) async {
    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalRecentTransaction> responseList = new List();

    await _client
        .apiGetPortalRecentTransactions(request.toJson())
        .then((response) {
      responseList.addAll(response);
    }).catchError((Object obj) {
      return responseList;
    });
    return responseList;
  }

  static Future<dynamic> sendRequestForPortalStudentVisualization(
      final Student request) async {
    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalStudentVisualization> responseList = new List();

    await _client
        .apiGetPortalStudentVisualization(request.toJson())
        .then((response) {
      responseList.addAll(response);
    }).catchError((Object obj) {
      return responseList;
    });
    return responseList;
  }

  static Future<dynamic> sendRequestForPortalStudentVisualizationAverage(
      final Student request) async {
    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalStudentVisualizationAverage> responseList = new List();

    await _client
        .apiGetPortalStudentVisualizationAverage(request.toJson())
        .then((response) {
      responseList.addAll(response);
    }).catchError((Object obj) {
      return responseList;
    });
    return responseList;
  }

  static Future<dynamic> sendRequestForPortalStudentResultsExtended(
      final Student request) async {
    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalStudentResultsExtended> responseList = new List();

    await _client
        .apiGetPortalStudentResultsExtended(request.toJson())
        .then((response) {
      responseList.addAll(response);
    }).catchError((Object obj) {
      return responseList;
    });
    return responseList;
  }

  static Future<dynamic> sendRequestForPortalSMSHistory() async {
    Student request = await AuthenticateUserDAO().getStudent();
    // final Dio dio = Dio();
    // dio.options.headers["Content-Type"] = "application/json";
    // final _client = RestClient(dio);

    // final List<PortalNotification> responseList = new List();

    // await _client.apiGetPortalSMSHistory(request.toJson()).then((response) {
    //   responseList.addAll(response);
    // }).catchError((Object obj) {
    //   return responseList;
    // });

    // return responseList;

    List<PortalNotificationMessage> notificationMessageList = new List();
    for (PortalNotification notif in await _getDummySMSHistory()) {
      PortalNotificationMessage notificationMessage =
          new PortalNotificationMessage(
              notif.MsgID, notif.Msg, notif.DateSent, true,
              msgIsChat: false,
              msgIsTransaction: false,
              msgIsEvents: false,
              msgIsResults: false);

      //sleep(const Duration(seconds: 5));

      if (notificationMessage.Msg.contains("Results") ||
          notificationMessage.Msg.contains("term") ||
          notificationMessage.Msg.contains('results')) {
        notificationMessage.msgIsResults = true;
      } else if (notificationMessage.Msg.contains("receipt") ||
          notificationMessage.Msg.contains("transaction") ||
          notificationMessage.Msg.contains("Receipt") ||
          notificationMessage.Msg.contains("Transaction")) {
        notificationMessage.msgIsTransaction = true;
      } else if (notificationMessage.Msg.contains("event") ||
          notificationMessage.Msg.contains("Event")) {
        notificationMessage.msgIsEvents = true;
      }
      if (notificationMessage.Msg.contains("chat") ||
          notificationMessage.Msg.contains("Chat")) {
        notificationMessage.msgIsChat = true;
      }

      notificationMessageList.add(notificationMessage);
    }

    return notificationMessageList;
  }

  static dynamic _getDummySMSHistory() {
    final List<PortalNotification> responseList = new List();
    for (Map<String, dynamic> outerMap in smsHistory) {
      var smss = PortalNotification.fromJson(outerMap);
      responseList.add(smss);
    }

    return responseList;
  }

  static Future<dynamic> sendRequestForPortalChargeTypes() async {
    // Student request = await AuthenticateUserDAO().getStudent();
    // final Dio dio = Dio();
    // dio.options.headers["Content-Type"] = "application/json";
    // final _client = RestClient(dio);

    // final List<PortalChargeTypeResponseModel> responseList = new List();

    // await _client.apiGetPortalChargeTypes(request.toJson()).then((response) {
    //   responseList.addAll(response);
    // }).catchError((Object obj) {
    //   return responseList;
    // });

    // return responseList;

    dynamic data = await _getDummyChargeTypes();
    return data;
  }

  static dynamic _getDummyChargeTypes() {
    final List<PortalChargeTypeResponseModel> responseList = new List();
    for (Map<String, dynamic> outerMap in chargeType) {
      var charge = PortalChargeTypeResponseModel.fromJson(outerMap);
      responseList.add(charge);
    }

    return responseList;
  }

  static Future<dynamic> sendRequestForPortalChurchServices() async {
    // Student request = await AuthenticateUserDAO().getStudent();
    // final Dio dio = Dio();
    // dio.options.headers["Content-Type"] = "application/json";
    // final _client = RestClient(dio);

    // String responseList = "";

    // await _client.apiGetPortalCompanyLogo(request.toJson()).then((response) {
    //   responseList = response;
    // }).catchError((Object obj) {
    //   return responseList;
    // });

    // return responseList;

    dynamic data = await _getDummyChurchServices();
    return data;
  }

  static dynamic _getDummyChurchServices() {
    final List<PortalChurchServices> responseList = new List();
    for (Map<String, dynamic> outerMap in churchServices) {
      var services = PortalChurchServices.fromJson(outerMap);
      responseList.add(services);
    }

    return responseList;
  }

  static Future<dynamic> sendRequestForPortalServiceTypes() async {
    dynamic data = await _getDummyServiceType();
    return data;
  }

  static dynamic _getDummyServiceType() {
    final List<ServiceTypesModel> responseList = new List();
    for (Map<String, dynamic> outerMap in serviceTypes) {
      var serviceType = ServiceTypesModel.fromJson(outerMap);
      responseList.add(serviceType);
    }

    return responseList;
  }

  static Future<dynamic> sendReqeustForPortalVideoGallery() async {
    Student request = await AuthenticateUserDAO().getStudent();

    final Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    final _client = RestClient(dio);

    final List<PortalVideoGalleryResponseModel> responseList = new List();

    await _client.apiGetPortalVideoGallery(request.toJson()).then((response) {
      responseList.addAll(response);
    }).catchError((Object obj) {
      return responseList;
    });

    return responseList;
  }

  static Future<dynamic> sendRequestForPortalMemberProfile() async {
    dynamic data = await _getDummyProfileMemberProfile();
    return data;
  }

  static dynamic _getDummyProfileMemberProfile() {
    //final List<PortalMemberProfile> responseList = new List();
    var album;
    for (Map<String, dynamic> outerMap in profile) {
      album = PortalMemberProfileModel.fromJson(outerMap);
      //responseList.add(album);
    }

    return album;
  }

  static Future<dynamic> sendRequestForPortalPortalPhotoGallery() async {
    // final dynamic request = await AuthenticateUserDAO().getUser();

    // @RestApi(baseUrl: 'https://church.mzizi.co.ke')
    // final Dio dio = Dio();
    // dio.options.headers["Content-Type"] = "application/json";
    // final _client = RestClient(dio);

    // final List<PortalPhotoGallery> responseList = new List();

    // await _client.apiGetPortalPhotoGallery({"OrganizationID": request[0].OrganizationID}).then((response) {
    //   responseList.addAll(response);
    // }).catchError((Object obj) {
    //   return responseList;
    // });

    dynamic data = await _getDummyPhotoGallery();

    return data;
  }

  static dynamic _getDummyPhotoGallery() {
    final List<PortalPhotoGallery> responseList = new List();
    for (Map<String, dynamic> outerMap in photosAlbums) {
      var album = PortalPhotoGallery.fromJson(outerMap);
      responseList.add(album);
    }

    return responseList;
  }
}
