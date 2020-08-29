import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/portal_recent_transaction_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_recent_transaction_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';

class HomeRecentPledgeContributions extends StatelessWidget {
  bool showTopSection;

  HomeRecentPledgeContributions({Key key, this.showTopSection = true})
      : super(key: key);

  Future<dynamic> _optionToFetchOnline() async {
    PortalRecentTransactionDAO dao = new PortalRecentTransactionDAO();

    try {
      if (await UtilityFunctions.checkConnection()) {
        Student student = await AuthenticateUserDAO().getStudent();
        //Student student = new Student("23309", "1000");
        if (student != null) {
          final dynamic transactions =
              await ApiController.sendRequestForPortalRecentTransaction(
                  student);

          await dao.deletePortalRecentTransactions();

          await dao.insertPortalRecentTransactionDAO(transactions);

          return await dao.getPortalRecentTransactions();
        } else {
          return dao.getPortalRecentTransactions();
        }
      } else {
        return dao.getPortalRecentTransactions();
      }
    } catch (e) {
      return dao.getPortalRecentTransactions();
    }
  }

  Widget recentPledgesAndContributionsListViewItemWidget(
      List<PortalRecentTransaction> portalRecentTransactionList) {
    List<DataRow> rows = new List();

    for (int row = 0; row < portalRecentTransactionList.length; row++) {
      PortalRecentTransaction response = portalRecentTransactionList[row];
      DataRow dataRow = new DataRow(cells: [
        DataCell(
          Text(UtilityFunctions.formatDate(response.TranDate),
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        DataCell(Text(response.RefNo,
            style: TextStyle(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.bold))),
        DataCell(Text(
            UtilityFunctions.formatToCurrencyWithMoneyFormatterPUB(
                response.TranAmount),
            style: TextStyle(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.bold))),
        DataCell(Container(
          child: Text(
              UtilityFunctions.formatToCurrencyWithMoneyFormatterPUB(
                  response.BalAmount),
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        )),
      ]);
      rows.add(dataRow);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: SingleChildScrollView(
            child: DataTable(
                columnSpacing: 30,
                columns: [
                  DataColumn(
                      label: Text('Date',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF487890),
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Item',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF487890),
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Amount',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF487890),
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Running Bal.',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF487890),
                              fontWeight: FontWeight.bold))),
                ],
                rows: rows)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          showTopSection
              ? Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xFF487890), width: 1.5))),
                  padding:
                      EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
                  width: double.infinity,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.clipboardList,
                              color: Color(0xFF487890)),
                          SizedBox(height: 5),
                          Text("Recent Pledges & Contributions",
                              style: TextStyle(
                                  color: Color(0xFF487890), fontSize: 15))
                        ],
                      ),
                      SpringButton(
                        SpringButtonType.OnlyScale,
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 18, right: 18, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xFF487890), width: 1.0),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text('More',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF487890),
                                    )))),
                        onTapDown: (_) {
                          RouteController.routeMethod(2,
                              controller: Controller.Navigator,
                              context: context);
                        },
                      )
                    ],
                  ),
                )
              : Container(),
          Container(
              //height: !showTopSection ? 250 : 430,
              //color: Colors.black,
              child: EnhancedFutureBuilder(
                  future: _optionToFetchOnline(),
                  rememberFutureResult: showTopSection,
                  whenDone: (dynamic data) {
                    List<PortalRecentTransaction> portalRecentTransactionList =
                        data;
                    Widget noContent = Center(
                      child: Container(

                        margin: EdgeInsets.only(top:70, bottom: 70),
                                              child: Text('No content to show',
                            style: TextStyle(fontSize: 15, color: Colors.amber)),
                      ),
                    );

                    return data == null
                        ? noContent
                        : data.length <= 0
                            ? noContent
                            : recentPledgesAndContributionsListViewItemWidget(
                                portalRecentTransactionList);
                  },
                  whenNotDone: Center(
                      child:
                          // !showTopSection
                          //     ? Container(
                          //         // height: 250,
                          //         // width: 250,
                          //         padding: EdgeInsets.all(30),
                          //         child: Image.asset(
                          //             "assets/images/member_app_assets/Curve-Loading.gif"),
                          //       )
                          //     :
                          Container(
                    height: 200,
                    width: 200,
                    //padding: EdgeInsets.all(30),
                    child: Image.asset(
                        "assets/images/member_app_assets/Curve-Loading.gif"),
                  )))),
        ],
      ),
    );
  }
}
