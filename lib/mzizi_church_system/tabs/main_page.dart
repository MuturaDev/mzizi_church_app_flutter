import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';

class MainPage extends KFDrawerContent {
  MainPage({
    Key key,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //ANNOUNCEMENT SECTION
              Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        // height: MediaQuery.of(context).size.height/2,
                        child: Image(
                            // height: MediaQuery.of(context).size.height/2,
                            // width: double.infinity,
                          image: AssetImage(
                              "assets/images/member_app_assets/dashboard_home_bg.jpg"),
                        ),
                      )),
                  Positioned(
                    top: 25.0,
                    left: 5.0,
                    right: 5.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          child: Material(
                            shadowColor: Colors.transparent,
                            color: Colors.transparent,
                            child: IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: widget.onMenuPressed,
                            ),
                          ),
                        ),
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: 'SUNDAY',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'MontserratBold',
                                  color: Colors.white,
                                  fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '   ',
                                ),
                                TextSpan(
                                    text: 'March 3, 2016',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 13)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Container(
                            height: 28.0,
                            width: 28.0,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                                child: Text(
                              "10",
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: 200.0,
                      right: 5.0,
                      left: 5.0,
                      child: Container(
                          //height: 100.0,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "A Life Free of Sin",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        wordSpacing: 8,
                                        color: Colors.white,
                                        fontSize: 25),
                                  ),
                                  SizedBox(height: 5.0),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'TODAY',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF487890),
                                            fontSize: 14),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '   ',
                                          ),
                                          TextSpan(
                                              text: 'by',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle: FontStyle.italic,
                                                  color: Color(0xFF487890),
                                                  fontSize: 12)),
                                          TextSpan(
                                            text: '   ',
                                          ),
                                          TextSpan(
                                              text: 'PASTOR RANDY',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xFF487890),
                                                  fontSize: 14)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SpringButton(
                                SpringButtonType.OnlyScale,
                                // row(
                                //   "Increment",
                                //   Colors.deepPurpleAccent,
                                // ),
                                Container(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Icon(
                                      Icons.info_outline,
                                      color: Color(0xFF487890),
                                      size: 30,
                                    )),
                                onTapDown: (_) {},
                                //(_) => incrementCounter(),
                                // onLongPress: () => timer = Timer.periodic(
                                //   const Duration(milliseconds: 100),
                                //   (_) => incrementCounter(),
                                // ),
                                // onLongPressEnd: (_) {
                                //   timer?.cancel();
                                // },
                              ),
                            ],
                          )))
                ],
              ),
              Expanded(
                child: Container(
                  // color: Colors.red,
                  child: Stack(children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.only(top: 16),
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(height: 1, color: Colors.grey[200]);
                        },
                        physics: ClampingScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return (index % 2) == 0
                              ? dashboardBottomListViewItemWidget(new CommunicationModel(Icons.pin_drop, "Check In", ['to', "CHILDCARE, BIBLE STUDY..."]))
                              : dashboardBottomListViewItemWidget(new CommunicationModel(Icons.date_range, "Annoucements", ['for', "THIS WEEK"]));
                         
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      margin: EdgeInsets.all(0),
                      height: 60,
                      color: Color(0xFF487890),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.receipt,
                                color: Colors.white,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Today\'s',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                        fontSize: 13),
                                    children: <TextSpan>[
                                      TextSpan(text: "   "),
                                      TextSpan(
                                          text: 'MESSAGE NOTES',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.white,
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SpringButton(
                            SpringButtonType.OnlyScale,
                            // row(
                            //   "Increment",
                            //   Colors.deepPurpleAccent,
                            // ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 18, right: 18, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 1.0),
                                  color: Color(0xFF487890),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text('VIEW',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            onTapDown: (_) {},
                            //(_) => incrementCounter(),
                            // onLongPress: () => timer = Timer.periodic(
                            //   const Duration(milliseconds: 100),
                            //   (_) => incrementCounter(),
                            // ),
                            // onLongPressEnd: (_) {
                            //   timer?.cancel();
                            // },
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboardBottomListViewItemWidget(CommunicationModel communication) {
    return Column(children: <Widget>[
      Container(
        //color: Colors.greenAccent,
        padding: EdgeInsets.only(left: 20.0, right: 10),
        height: 150.0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(
                  communication.icon,
                  color: Color(0xFF487890),
                  size: 40,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(communication.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w200)),
                      RichText(
                        text: TextSpan(
                          text: communication.subTitle[0],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[300],
                              fontSize: 13),
                          children: <TextSpan>[
                            TextSpan(text: " "),
                            TextSpan(
                                text: communication.subTitle[1],
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF7DACC6),
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                    ]),
              ),
              SpringButton(
                SpringButtonType.OnlyScale,
                // row(
                //   "Increment",
                //   Colors.deepPurpleAccent,
                // ),
                Container(
                    child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: 35,
                )),
                onTapDown: (_) {},
                //(_) => incrementCounter(),
                // onLongPress: () => timer = Timer.periodic(
                //   const Duration(milliseconds: 100),
                //   (_) => incrementCounter(),
                // ),
                // onLongPressEnd: (_) {
                //   timer?.cancel();
                // },
              ),
            ],
          ),
        ),
      ),
      SizedBox(
          height: 1,
          width: double.infinity,
          child: Container(color: Colors.grey[200])),
    ]);
  }

}


class CommunicationModel{
  IconData icon;
  String title;
  List<String> subTitle;

   CommunicationModel(IconData icon, String title, List<String> subTitle){
     this.icon = icon;
     this.title = title;
      this.subTitle = subTitle;
   }
}
