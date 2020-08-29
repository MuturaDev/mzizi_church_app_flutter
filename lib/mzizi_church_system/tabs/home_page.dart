import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/home_announcements.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/home_carousell.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/home_recent_transactions.dart';

import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/Screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/dashboard_screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';

class HomePage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;

  HomePage({this.onMenuPressedHere});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
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
              title: Text('Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              centerTitle: true,
              actions: <Widget>[
                // SpringButton(
                //   SpringButtonType.OnlyScale,
                //   Padding(
                //     padding: EdgeInsets.all(13.0),
                //     child: Container(
                //       height: 28.0,
                //       width: 28.0,
                //       decoration: BoxDecoration(
                //           color: Colors.red,
                //           borderRadius: BorderRadius.circular(20.0)),
                //       child: Center(
                //           child: Text(
                //         "0",
                //         style: TextStyle(fontSize: 13.0, color: Colors.white),
                //       )),
                //     ),
                //   ),
                //   onTapDown: (_) {
                //     RouteController.routeMethod(13,
                //         controller: Controller.Navigator, context: context);
                //   },
                // ),
                SpringButton(
                  SpringButtonType.OnlyScale,
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(LineIcons.comments,
                          color: Colors.white, size: 30)),
                  onTapDown: (_) {
                    RouteController.routeMethod(10,
                        controller: Controller.Navigator, context: context);
                  },
                ),
              ],
            ),
            body: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //ANNOUNCEMENT SECTION
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              // height: MediaQuery.of(context).size.height/2,
                              //https://github.com/serenader2014/flutter_carousel_slider/blob/master/example/lib/main.dart
                              child: Container(
                                child: Stack(children: [
                                  HomeCarousell(),
                                ]),
                              ),
                            )),
                      ],
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        HomeAnnouncements(),
                                        HomeRecentPledgeContributions()
                                        // announcementsWidget(),
                                      ],
                                    ),
                                  )
                                ])),
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }
}
