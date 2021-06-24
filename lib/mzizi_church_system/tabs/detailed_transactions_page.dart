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
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
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
  _PortalDetailedTransactionsPageState createState() =>
      _PortalDetailedTransactionsPageState();
}

class _PortalDetailedTransactionsPageState
    extends State<PortalDetailedTransactionsPage> {
  Future<dynamic> _optionToFetchOnline() async {
    PortalDetailedTransactionDAO dao = new PortalDetailedTransactionDAO();
    if (await UtilityFunctions.checkConnection()) {
      Student student = await AuthenticateUserDAO().getStudent();
      //Student student = new Student("23309", "1000");
      if (student != null) {
        try {
          final dynamic transactions =
              await ApiController.sendRequestForPortalDetailedTransactions(
                  student);

          await dao.deletePortalDetailedTransaction(
              await dao.getPortalDetailedTransaction());

          await dao.insertPortalDetailedTransaction(transactions);

          List<PortalDetailedTransaction> transaction =
              await dao.getPortalDetailedTransaction();

          return transaction;
        } catch (e) {
          return dao.getPortalDetailedTransaction();
        }
      } else {
        return dao.getPortalDetailedTransaction();
      }
    } else {
      return dao.getPortalDetailedTransaction();
    }
  }

  Future<bool> _onBackPressed() {
    RouteController.routeMethod(0,
        controller: Controller.Navigator, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: _onBackPressed,
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
                  fontSize: 20,
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
            color: Color(0xFF487890),
            child: EnhancedFutureBuilder(
                future: _optionToFetchOnline(),
                rememberFutureResult: false,
                whenNotDone: Center(
                    child: Container(
                  height: 250,
                  width: 250,
                  child: Image.asset(
                      'assets/images/member_app_assets/Curve-Loading.gif'),
                )),
                whenDone: (dynamic data) {
                  Widget noContent = Center(
                    child: Text('No content to show',
                        style: TextStyle(fontSize: 15, color: Colors.amber)),
                  );

                  return data == null
                      ? noContent
                      : data.length <= 0
                          ? noContent
                          : Stack(
                              children: <Widget>[
                                // Align(
                                //   alignment: Alignment.topCenter,
                                //   child: Container(

                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(5.0),
                                //         // color: Colors.blue
                                //         ),
                                //     padding: EdgeInsets.all(0.0),
                                //     margin: EdgeInsets.only(top: 10.0, right: 5.0),
                                //     child: Text(
                                //       'Current balance is: $feeBalance',
                                //       textAlign: TextAlign.center,
                                //       style: TextStyle(
                                //           color: Colors.white,
                                //           fontWeight: FontWeight.bold,
                                //           fontSize: 20.0),
                                //     ),
                                //   ),
                                // ),

                                Container(
                                  margin:
                                      EdgeInsets.only(top: 10.0, bottom: 5.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: RefreshIndicator(
                                      child: Scrollbar(
                                        child: ListView.builder(
                                          reverse: false,
                                          itemCount: data.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return _transactionItemWidget(
                                                data.reversed.toList()[index]);
                                          },
                                        ),
                                      ),
                                      onRefresh: () async {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                )
                              ],
                            );
                }),
          ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        // border: Border.all(
        //     color: Color(0xFF487890), width: 1.0, style: BorderStyle.solid)
      ),
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
            rightLabel: UtilityFunctions.formatToCurrencyWithMoneyFormatterPUB(
                transaction.TranAmount),
          ),
          SizedBox(
            height: 10.0,
          ),
          _rowItem(
            leftLabel: 'Running Balance',
            rightLabel: UtilityFunctions.formatToCurrencyWithMoneyFormatterPUB(
                transaction.BalAmount),
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
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Text(
                        leftLabel,
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: isReceiptOrInvoice
                                ? Colors.green
                                : Colors.orange),
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
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    // Text(
                    //   centerLabel,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(fontSize: 13.0, color: Colors.black87),
                    // ),
                    Text(
                      rightLabel,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13.0, color: Colors.grey),
                    )
                  ],
                ));

    return returnWidget;
  }

  Widget _noContentWidget(BuildContext context) => Center(
        child: Text(
          'No school transaction details to show',
          style: TextStyle(
              color: Colors.green,
              fontSize: 15.0,
              fontWeight: FontWeight.normal),
        ),
      );
}
