import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/portal_contacts_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/portal_detailed_transaction_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_contacts_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_fee_transaction_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_widgets.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';

class PortalDetailedTransactionsPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  PortalDetailedTransactionsPage({this.onMenuPressedHere});

  @override
  _PortalDetailedTransactionsPageState createState() => _PortalDetailedTransactionsPageState();
}

class _PortalDetailedTransactionsPageState extends State<PortalDetailedTransactionsPage> {

 Future<dynamic> _optionToFetchOnline() async {
    PortalDetailedTransactionDAO dao = new PortalDetailedTransactionDAO();
    if (await UtilityFunctions.checkConnection()) {
     // Student student = await AuthenticateUserDAO().getStudent();
     Student student = new Student("23309","1000");
      if (student != null) {
        final dynamic transactions =
            await ApiController.sendRequestForPortalDetailedTransactions(
                student);

        await dao.deletePortalDetailedTransaction(
            await dao.getPortalDetailedTransaction());

        await dao.insertPortalDetailedTransaction(transactions);

        List<PortalDetailedTransaction> transaction =
            await dao.getPortalDetailedTransaction();

        return transaction;
      } else {
        return dao.getPortalDetailedTransaction();
      }
    } else {
      return dao.getPortalDetailedTransaction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF487890),
          primary: true,
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            child: Material(
              shadowColor: Colors.transparent,
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: widget.onMenuPressedHere != null
                    ? widget.onMenuPressedHere
                    : widget.onMenuPressed,
              ),
            ),
          ),
          title: Text('Pledges & Contributions',
              style: TextStyle(
                fontSize: 15,
              )),
              centerTitle: true,
          // actions: <Widget>[
          //   SpringButton(
          //     SpringButtonType.OnlyScale,
          //     Container(
          //       child: Icon(LineIcons.paper_plane),
          //     ),
          //     onTapDown: (_) {},
          //   ),
          //   SizedBox(width: 10),
          //   Container(
          //       child: FaIcon(FontAwesomeIcons.donate, size: 20, color: Colors.red,),
          //     ),
          //   SpringButton(
          //     SpringButtonType.OnlyScale,
          //     Container(
          //       child: Icon(Icons.refresh),
          //     ),
          //     onTapDown: (_) {},
          //   ),
          // ],
        ),
        body: Container(
      child: EnhancedFutureBuilder(
          future: _optionToFetchOnline(),
          rememberFutureResult: false,
          whenNotDone: Center(
            child: CircularProgressIndicator(),
          ),
          whenDone: (dynamic data) {
            List<PortalDetailedTransaction> transactionList1 = data;

            if (transactionList1 == null) {
              return _noContentWidget(context);
            }

            List<PortalDetailedTransaction> transactionList =
                transactionList1.reversed.toList();

            String feeBalance = transactionList == null
                ? UtilityFunctions.formatToTwoDecimalPlaces(0.0)
                : UtilityFunctions.formatToTwoDecimalPlaces(
                    transactionList.length > 0
                        ? double.tryParse(transactionList[0].BalAmount)
                        : 0.0);

            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 250.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.lightBlueAccent),
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 20.0, right: 5.0),
                    child: Text(
                      'Current balance is: $feeBalance/=',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    ),
                  ),
                ),
                transactionList == null
                    ? _noContentWidget(context)
                    : transactionList.length > 0
                        ? Container(
                            margin: EdgeInsets.only(top: 60.0, bottom: 5.0),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: RefreshIndicator(
                                child: Scrollbar(
                                  child: ListView.builder(
                                    reverse: false,
                                    itemCount: transactionList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return _transactionItemWidget(
                                          transactionList[index]);
                                    },
                                  ),
                                ),
                                onRefresh: () async {
                                  setState(() {});
                                },
                              ),
                            ),
                          )
                        : _noContentWidget(context)
              ],
            );
          }),
    ),
      ),
    );
  }


//OTHER WIDGETS FOR Transactions
Widget _transactionItemWidget(
  PortalDetailedTransaction transaction,
) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
    margin: EdgeInsets.symmetric(vertical: 5.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: Color(0xFF487890), width: 1.0, style: BorderStyle.solid)),
    child: Column(
      children: <Widget>[
        _rowItem(
            leftLabel: 'Ref No.',
            rightLabel: transaction.TranType,
            header: true,
            receiptOrInvoice: transaction.TransType),
        SizedBox(
          height: 5.0,
        ),
        _rowItem(divider: true),
        SizedBox(
          height: 10.0,
        ),
        _rowItem(
          leftLabel: 'Receipt Date',
          //rightLabel: transaction.DatePosted,
          rightLabel: UtilityFunctions.formatDate(
              transaction.DatePosted.replaceAll(new RegExp(r'12:00:00'), '')
                  .replaceAll(new RegExp(r'AM'), '')
                  .trim()),
        ),
        SizedBox(
          height: 10.0,
        ),
        _rowItem(leftLabel: 'Narration', rightLabel: transaction.RefNo),
        SizedBox(
          height: 10.0,
        ),
        _rowItem(
          leftLabel: 'Amount',
          rightLabel: UtilityFunctions.formatToTwoDecimalPlaces(
              double.tryParse(transaction.TranAmount)),
        ),
        SizedBox(
          height: 10.0,
        ),
        _rowItem(
          leftLabel: 'Running Balance',
          rightLabel: UtilityFunctions.formatToTwoDecimalPlaces(
              double.tryParse(transaction.BalAmount)),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    ),
  );
}

Widget _rowItem(
    {String leftLabel = '',
    String centerLabel = ':',
    String rightLabel,
    bool header = false,
    bool divider = false,
    String receiptOrInvoice}) {
  //RECEIPT = 2 OR INVOICE = 0
  bool isReceiptOrInvoice =
      receiptOrInvoice == '2' ? true : receiptOrInvoice == '0' ? false : true;

  Widget returnWidget = divider
      ? Divider(
          color: Colors.black,
          height: 2.0,
        )
      : header
          ? Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    leftLabel,
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded( 
                                      child: Container(
                     // width: 200.0,
                      child: Text(
                        rightLabel,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                            color: Colors.black),
                      ),
                      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color:
                              isReceiptOrInvoice ? Colors.green : Colors.orange),
                    ),
                  )
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    leftLabel,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13.0, color: Colors.black87),
                  ),
                  // Text(
                  //   centerLabel,
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(fontSize: 13.0, color: Colors.black87),
                  // ),
                  Text(
                    rightLabel,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13.0, color: Colors.black87),
                  )
                ],
              ));

  return returnWidget;
}

Widget _noContentWidget(BuildContext context) => Center(
      child: Text(
        'No school transaction details to show',
        style: TextStyle(
            color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.normal),
      ),
    );

}

