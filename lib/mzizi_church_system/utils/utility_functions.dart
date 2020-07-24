
import 'package:connectivity/connectivity.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';

class UtilityFunctions{

   static Future checkConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if ((connectivityResult == ConnectivityResult.mobile) ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  static String formatDate(String date) {
    //var formatter = new DateFormat('EEE, dd MMM yyyy');
    var datetime;

    // try {
    datetime = DateFormat.yMd('en_US').parse(date);
    //   print('Date to format: ' + date);
    // } catch (e) {
    //   print("Exception Parsing date: " + e.toString());
    // }
    final df = new DateFormat('dd MMM yyyy');

    //return DateFormat.yMMMMEEEEd().format(datetime);
    return df.format(datetime);
    //==> 'Wednesday, January 10, 2012';//formatter.format(datetime);

    //print('Date to format: ' + date);

    //return date;
  }

   static String formatToTwoDecimalPlaces(double n) {
    var forInts = new NumberFormat();
    var forFractions = new NumberFormat();

    forFractions.minimumFractionDigits = 2;
    forFractions.maximumFractionDigits = 2;

    return _formatToCurrencyWithMoneyFormatterPUB(n);
    //return n.toStringAsFixed(n.truncateToDouble() == n ? 2 : 2);
  }

  static String formatToCurrency(double n) {
    final formatCurrency = new NumberFormat.simpleCurrency();

    return formatCurrency.format(n);
  }

  static String _formatToCurrencyWithMoneyFormatterPUB(double n) {
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
        amount: n,
        settings: MoneyFormatterSettings(
            symbol: 'Ksh ',
            thousandSeparator: ',',
            decimalSeparator: '.',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 2,
            compactFormatType: CompactFormatType.short));

    return fmf.output.symbolOnLeft.toString();
  }


  
}