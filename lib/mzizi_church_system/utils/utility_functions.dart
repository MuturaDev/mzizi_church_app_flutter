import 'dart:io';

//import 'package:connectivity/connectivity.dart';
//import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';

class UtilityFunctions {
  //The test to actually see if there is a connection
  //https://stackoverflow.com/questions/49648022/check-whether-there-is-an-internet-connection-available-on-flutter-app
  static Future<bool> checkConnection() async {
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
}
