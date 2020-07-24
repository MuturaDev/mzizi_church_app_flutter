import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  final List<String> imgList = [
    // 'https://imagizer.imageshack.com/img922/1959/IaIQx8.jpg',
    // 'https://imagizer.imageshack.com/img924/7272/YYCa8d.jpg',
    // 'https://imagizer.imageshack.com/img924/3559/QWs8fu.jpg',
    // 'https://imagizer.imageshack.com/img923/268/u1cHRX.jpg',
    // 'https://imagizer.imageshack.com/img924/7841/QwipFB.jpg',
    // 'https://imagizer.imageshack.com/img923/1769/wTyQhO.jpg'

    //  'https://imagizer.imageshack.com/img923/6161/2TUveM.jpg',
    //   'https://imagizer.imageshack.com/img924/120/c0yebZ.jpg',
    //   'https://imagizer.imageshack.com/img924/4274/LXwd4y.jpg',

    'https://imagizer.imageshack.com/img924/1260/o8aVXk.jpg',

    // 'http://www.jccmombasa.org/images/2018.jpg',
    // 'http://www.jccmombasa.org/images/church.jpg',
    // 'http://www.jccmombasa.org/images/e.jpg',
    // 'http://www.jccmombasa.org/images/f.jpg',
    // 'http://www.jccmombasa.org/images/c.jpg'
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
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
              SpringButton(
                SpringButtonType.OnlyScale,
                Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Container(
                    height: 28.0,
                    width: 28.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                        child: Text(
                      "0",
                      style: TextStyle(fontSize: 13.0, color: Colors.white),
                    )),
                  ),
                ),
                onTapDown: (_) {
                 RouteController.routeMethod(13,
                      controller: Controller.Navigator, context: context);
                },
              ),
              SpringButton(
                SpringButtonType.OnlyScale,
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(FontAwesomeIcons.comments,
                        color: Colors.white, size: 30)),
                onTapDown: (_) {
                   RouteController.routeMethod(10,
                      controller: Controller.Navigator, context: context);
                },
              ),
            ],
          ),
          body: Container(
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
                                // Container(
                                //   height:
                                //       MediaQuery.of(context).size.height / 2 -
                                //           200,
                                //   width: double.infinity,
                                //   color: Colors.red,
                                // ),
                                HomeCarousell(),

                                Positioned(
                                  top: MediaQuery.of(context).size.height / 2 -
                                      250,
                                  right: 0.0,
                                  left: 0.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: imgList.map((url) {
                                      int index = imgList.indexOf(url);
                                      return Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _current == index
                                              ? Colors.white
                                              : Color(0xFF487890),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ]),
                            ),

                            // Image(
                            //   // height: MediaQuery.of(context).size.height/2,
                            //   // width: double.infinity,
                            //   image: AssetImage(
                            //       "assets/images/member_app_assets/dashboard_home_bg.jpg"),
                            // ),
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
    );
  }
}
