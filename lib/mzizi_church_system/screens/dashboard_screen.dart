import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Reader/bible_bloc.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Settings/settings_bloc.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/Provider/MultiPartXmlBibleProvider.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/Provider/ReferenceProvider.dart';
import 'package:mzizichurchsystem/mzizi_bible/main_bible.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/google_bottom_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/announcements_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/auth_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/calendar_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/check_in_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/contact_info_page.dart';

import 'package:mzizichurchsystem/mzizi_church_system/tabs/dashboard.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/detailed_transactions_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/events_tap.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/home_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/main_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/notifications_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_chat_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/sermon_series_tab.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/settings_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';

class DashboardScreen extends KFDrawerContent {
  int selectedIndex = 0;
  VoidCallback passOnMenuPressed;
  dynamic messagepass;

  DashboardScreen(
      {this.selectedIndex, this.passOnMenuPressed, this.messagepass});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        // appBar: AppBar(
        //    leading: FlatButton(onPressed: (){
        //       Navigator.push(context,
        //                   MaterialPageRoute(builder: (context) => ExampleScreens()));
        //     }, child: Icon(Icons.backspace)),
        //   title: const Text('Dashboard'),
        // ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: RouteController.routeMethod(
                  widget.selectedIndex == null ? 0 : widget.selectedIndex,
                  controller: Controller.DashboardScreen,
                  onMenuPressed: widget.onMenuPressed,
                  messagepass: widget.messagepass),
            ),
            Positioned(
              // top: 30,
              right: 0,
              left: 0,
              bottom: 0,
              child: EnhancedFutureBuilder(
                future: UtilityFunctions.checkConnection(context: context),
                rememberFutureResult: false,
                whenDone: (dynamic data) {
                  return !data
                      ? Container(
                          color: Colors.red,
                          height: 35,
                          child: Center(
                            child: Text(
                              'No internet connection. Some services won\'t work.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ))
                      : Container();
                },
                whenNotDone: Container(),
              ),
            )
          ],
        ),

        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              child: GNav(
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  //backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  duration: Duration(milliseconds: 100),
                  tabBackgroundColor: Colors.grey[800],
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                      backgroundColor: Color(0xFF487890),
                    ),
                    GButton(
                      icon: FontAwesomeIcons.comments,
                      iconSize: 20,
                      text: 'Chat (request service)',
                      backgroundColor: Color(0xFF487890),
                    ),
                    GButton(
                      icon: LineIcons.heart,
                      text: 'Make a Pledge',
                      backgroundColor: Color(0xFF487890),
                    ),
                    GButton(
                      icon: FontAwesomeIcons.moneyBillAlt,
                      iconSize: 20,
                      text: 'My Contributions',
                      backgroundColor: Color(0xFF487890),
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                      backgroundColor: Color(0xFF487890),
                    ),
                    GButton(
                      icon: Icons.contact_mail,
                      text: 'Contact Info',
                      backgroundColor: Color(0xFF487890),
                    ),
                  ],
                  selectedIndex:
                      widget.selectedIndex == null ? 0 : widget.selectedIndex,
                  onTabChange: (index) {
                    if (index == 0) {
                      RouteController.routeMethod(0,
                          controller: Controller.Navigator, context: context);
                    } else {
                      setState(() {
                        widget.selectedIndex = index;
                      });
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
