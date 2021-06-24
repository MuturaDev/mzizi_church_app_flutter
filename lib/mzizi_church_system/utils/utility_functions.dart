import 'dart:io';

//import 'package:connectivity/connectivity.dart';
//import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import 'package:intl/intl.dart';
import 'package:mzizichurchsystem/mzizi_church_system/flavor_mzizi_church_system/flavour_config.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/mzizi_app_version_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/mzizi_app_version_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_church_services_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/playstore_feature_update.dart';

class UtilityFunctions {
  //The test to actually see if there is a connection
  //https://stackoverflow.com/questions/49648022/check-whether-there-is-an-internet-connection-available-on-flutter-app
  static Future<bool> checkConnection({BuildContext context = null}) async {
    //CHECK INTERNET CONNECTION
    bool hasConnection;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    //CHECK THE VERSION OF THE APP
    try {
      if (hasConnection && context != null) {
        // String projectVersion = await GetVersion.projectVersion;
        // String projectCode = await GetVersion.projectCode;

        //TODO: UPDATE THIS BEFORE UPLOADING PRODUCTION TO PLAYSTORE,
          //TODO: Step 1: HERE
          //TODO: STEP 2: Android Build
          //TODO: STEP 3: API, _AppVersions in WebConfig
        MziziAppVersionRequest request = new MziziAppVersionRequest(
          "",
          FlavourConfig.isBwmc()
              ? '12'
              : FlavourConfig.isDcik()
                  ? '13'
                  : FlavourConfig.isJcc()
                      ? '14'
                      : FlavourConfig.isMzizicms() ? '11' : '11',
          FlavourConfig.isBwmc()
              ? 'BWMCAppVersion'
              : FlavourConfig.isDcik()
                  ? 'DCIKAppVersion'
                  : FlavourConfig.isJcc()
                      ? 'JCCAppVersion'
                      : FlavourConfig.isMzizicms()
                          ? 'MziziCMSAppVersion'
                          : 'MziziCMSAppVersion',
        );

        MziziAppVersion version =
            await ApiController.sendRequestForMziziAppVersion(request);

        if (version.ForceUpdate) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PlaystoreFeatureUpdate()));
        }
      }
    } catch (e) {}

    //The connection status changed send out an update to all listeners

    return hasConnection;
  }

  static String formatDate(String date) {
    if (date.contains(".")) date = date.replaceAll(".", "/");
    //var formatter = new DateFormat('EEE, dd MMM yyyy');
    var datetime;

    // try {
    datetime = DateFormat.yMd('en_US').parse(date);
    //   print('Date to format: ' + date);
    // } catch (e) {
    //   print("Exception Parsing date: " + e.toString());
    // }
    final df = new DateFormat('EE, dd MMM yyyy');

    //return DateFormat.yMMMMEEEEd().format(datetime);
    return df.format(datetime);
    //==> 'Wednesday, January 10, 2012';//formatter.format(datetime);

    //print('Date to format: ' + date);

    //return date;
  }

  static String formatToCurrencyWithMoneyFormatterPUB(String n) {
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
        amount: double.parse(n),
        settings: MoneyFormatterSettings(
            symbol: 'Ksh ',
            thousandSeparator: ',',
            decimalSeparator: '.',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 2,
            compactFormatType: CompactFormatType.short));

    return fmf.output.symbolOnLeft.toString();
  }

  static String getVideoIDFromYoutubeUrl(String url) {
    return url.replaceAll("https://www.youtube.com/embed/", "").replaceAll(
        "?enablejsapi=1&autoplay=1&fs=0?loop=0&modestbranding=1&rel=0", "");
  }

  static dynamic filterChurchServicesByDateAndServiceType(DateTime _dateTime,
      String selectedServiceType, List<PortalChurchServices> responseList) {
    //Filter with date
    List<PortalChurchServices> filterListWithDate = new List();
    //https://stackoverflow.com/questions/16126579/how-do-i-format-a-date-with-dart
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String selectedChurchDate = formatter.format(_dateTime);

    for (var service in responseList) {
      final String churchDate =
          _getFormatedChurchDate(service.ChurchServiceDate);
      if (churchDate == selectedChurchDate) {
        filterListWithDate.add(service);
      }
    }

    //Filter with service type

    List<PortalChurchServices> filterListWithServiceType = new List();
    // if (selectedServiceType == "-1") {
    for (var service in filterListWithDate) {
      if (service.ServiceType == selectedServiceType) {
        filterListWithServiceType.add(service);
      }
    }
    //}

    if (selectedServiceType == "-1" || selectedServiceType.isEmpty) {
      PortalChurchServices service = new PortalChurchServices(
          "-1", "Select Church Service", "", "", "", "", "", "", "");
      filterListWithDate.add(service);
    } else {
      PortalChurchServices service = new PortalChurchServices(
          "-1", "Select Church Service", "", "", "", "", "", "", "");
      filterListWithServiceType.add(service);
    }

    return selectedServiceType == "-1" || selectedServiceType.isEmpty
        ? filterListWithDate.reversed.toList()
        : filterListWithServiceType.reversed.toList();
  }

  static String _getFormatedChurchDate(String dateToSplite) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    //String dateToSplite = "8/30/2020 12:00:00 AM";
    var spliteDate = dateToSplite.split(" ");
    var dateParts = spliteDate[0].split("/"); //0=month, 1=day, 2=year

    DateTime date; //2020-09-6
    try {
      //2020-08-30
      var month =
          dateParts[0].split("").length > 1 ? dateParts[0] : "0" + dateParts[0];
      var day =
          dateParts[1].split("").length > 1 ? dateParts[1] : "0" + dateParts[1];
      date = DateTime.parse(dateParts[2] + "-" + month + "-" + day);
    } catch (e) {
      // return responseList;
    }
    return formatter.format(date);
  }
}
