import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/current_student_logout.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/portal_contacts_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/welcome_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_contacts_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/dashboard_screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/auth_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/class_builder.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';

class Screen extends StatefulWidget {
  int selectionIndex = 0;
  dynamic messagepass;
  Screen({this.selectionIndex, this.messagepass});
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
          controller: Controller.Screen, messagepass: widget.messagepass),
      // initialPage: ClassBuilder.fromString('DashboardScreen'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Home', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          //page: ClassBuilder.fromString('DashboardScreen'),
          page: RouteController.routeMethod(0, controller: Controller.Screen),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Upcoming Events',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(LineIcons.calendar_o, color: Colors.white),
          page: RouteController.routeMethod(18, controller: Controller.Screen),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'SMS History',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(LineIcons.history, color: Colors.white),
          page: RouteController.routeMethod(13, controller: Controller.Screen),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Video Gallery',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(LineIcons.video_camera, color: Colors.white),
          page: RouteController.routeMethod(16, //1,
              controller: Controller.Screen),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Photo Gallery',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(LineIcons.photo, color: Colors.white),
          page: RouteController.routeMethod(15, controller: Controller.Screen),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Church Service Booking',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.check_circle_outline, color: Colors.white),
          page: RouteController.routeMethod(12, controller: Controller.Screen),
        ),
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'Settings',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   icon: Icon(Icons.settings, color: Colors.white),
        //   page: RouteController.routeMethod(7,
        //       controller: Controller.Screen),
        // ),
      ],
    );
  }

  Future<dynamic> _optionToFetchOnline() async {
    PortalContactsDAO dao = new PortalContactsDAO();

    try {
      List<PortalContacts> contactList = await dao.getPortalContacts();
      if (contactList.length > 0) {
        return contactList;
      } else {
        if (await UtilityFunctions.checkConnection()) {
          Student student = await AuthenticateUserDAO().getStudent();
          //Student student = new Student("23309", "1000");
          if (student != null) {
            final dynamic transactions =
                await ApiController.sendRequestForPortalContacts(student);

            await dao.deletePortalContacts(await dao.getPortalContacts());

            await dao.insertPortalContacts(transactions);

            return await dao.getPortalContacts();
          } else {
            return dao.getPortalContacts();
          }
        } else {
          return dao.getPortalContacts();
        }
      }
    } catch (e) {
      return dao.getPortalContacts();
    }
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
          child: Column(
            children: <Widget>[
              Container(
                //color: Colors.black,
                height: 120,
                width: 120,
                margin: EdgeInsets.only(left: 20.0, top: 40),
                padding: EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 0),
                //padding: EdgeInsets.all(30),
                //     width: MediaQuery.of(context).size.width * 0.6,
                child: Image.asset(
                  'assets/images/member_app_assets/church_logo_no_bg2.png',
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(height: 5),
              EnhancedFutureBuilder(
                future: _optionToFetchOnline(),
                rememberFutureResult: true,
                whenDone: (dynamic data) {
                  List<PortalContacts> contactList = data;
                  return contactList == null
                      ? Text('',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold))
                      : contactList.length <= 0
                          ? Text('',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))
                          : Container(
                            width: 200,
                              //padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(contactList[0].SettingValue,
                              textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold, color: Colors.white)),
                            );
                },
                whenNotDone: Text('',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              )
            ],
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
          onPressed: () async {
            await Logout().logout(exceptAuthUser: true);

            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => WelcomePage()));
          },
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
