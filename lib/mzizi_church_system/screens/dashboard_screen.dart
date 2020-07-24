import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';
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

class DashboardScreen extends KFDrawerContent {
  int selectedIndex = 0;
  VoidCallback passOnMenuPressed;

  DashboardScreen({this.selectedIndex, this.passOnMenuPressed});

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
        body: RouteController.routeMethod(
          widget.selectedIndex == null ? 0 : widget.selectedIndex,
          controller: Controller.DashboardScreen,
          onMenuPressed: widget.onMenuPressed,
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
                      icon: LineIcons.money,
                      text: 'Make a Pledge',
                      backgroundColor: Color(0xFF487890),
                    ),
                    GButton(
                      icon: Icons.redeem,
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
                    setState(() {
                      widget.selectedIndex = index;
                    });
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
