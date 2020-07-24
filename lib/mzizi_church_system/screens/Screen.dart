import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/dashboard_screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/auth_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/class_builder.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';

class Screen extends StatefulWidget {
  int selectionIndex = 0;
  Screen({this.selectionIndex});
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: RouteController.routeMethod(widget.selectionIndex,
          controller: Controller.Screen),
      // initialPage: ClassBuilder.fromString('DashboardScreen'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Home', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          //page: ClassBuilder.fromString('DashboardScreen'),
          page: RouteController.routeMethod(0,
              controller: Controller.Screen),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Upcoming Events',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(LineIcons.calendar_o, color: Colors.white),
          page: RouteController.routeMethod(8,
              controller: Controller.Screen),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Sms History',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(LineIcons.history, color: Colors.white),
          page: RouteController.routeMethod(13,
              controller: Controller.Screen),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Video Gallery',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(LineIcons.video_camera, color: Colors.white),
          page: RouteController.routeMethod(6,//1,
              controller: Controller.Screen),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Photo Gallery',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(LineIcons.photo, color: Colors.white),
          page: RouteController.routeMethod(11,
              controller: Controller.Screen),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: RouteController.routeMethod(7,
              controller: Controller.Screen),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        //  borderRadius: 0.0,
        //  shadowBorderRadius: 0.0,
        //  menuPadding: EdgeInsets.all(0.0),
        //scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset(
              'assets/images/member_app_assets/jcc_logo2.png',
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'LOGOUT',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            FontAwesomeIcons.powerOff,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {},
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            //colors: [Color.fromRGBO(255, 255, 255, 1.0), Color.fromRGBO(44, 72, 171, 1.0)],
            colors: [Color.fromRGBO(255, 255, 255, 1.0), Color(0xFF487890)],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
