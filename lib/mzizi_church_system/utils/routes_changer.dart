import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/Screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/announcements_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/auth_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/calendar_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/check_in_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/contact_info_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/contributions_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/detailed_transactions_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/events_tap.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/home_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/more_announcements_details_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/notifications_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/photo_full_screen_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_application_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_chat_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_events_screens.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_member_profile.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_photo_gallery_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_video_gallery_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/self_enroll_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/sermon_series_tab.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/settings_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/class_builder.dart';

enum Controller { Screen, DashboardScreen, Navigator }

class RouteController {
//NewRoute << DashboardScreen << Screen << OldRoute
//NewerRoute << DashboardScreen << Screen << NewRoute

  static dynamic routeMethod(int selection,
      {Controller controller = Controller.DashboardScreen,
      VoidCallback onMenuPressed,
      BuildContext context,
      dynamic messagepass}) {
    ClassBuilder.registerClasses(
        routePage: selection, messagepass: messagepass);

    switch (selection) {
      case 0:
        //return ClassBuilder.fromString('Dashboard');
        dynamic returnWidgetOptions;
        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = HomePage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;
      case 1:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = PortalChatPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;
      case 2:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = PortalContributionsPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;
      case 3:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = PortalDetailedTransactionsPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;

      case 4:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = PortalMemberProfile(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;
      case 5:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = PortalContactInfoPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;
      // case 5:
      //   dynamic returnWidgetOptions;

      //   if (controller == Controller.Screen)
      //     returnWidgetOptions = ClassBuilder.fromString('AuthPage');
      //   else if (controller == Controller.DashboardScreen)
      //     returnWidgetOptions = AuthPage(
      //       onMenuPressedHere: onMenuPressed,
      //     );

      //   return returnWidgetOptions;
      //   break;
      case 6:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = PortalMoreAnnouncementsDetails(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;

        break;
      // case 6:
      // dynamic returnWidgetOptions;

      // if (controller == Controller.Screen)
      //   returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
      // else if (controller == Controller.DashboardScreen)
      //   returnWidgetOptions = CalendarPage(
      //     onMenuPressedHere: onMenuPressed,
      //   );
      // else if (controller == Controller.Navigator)
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Screen(
      //                 selectionIndex: selection,
      //               )));

      // return returnWidgetOptions;
      // break;
      case 7:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = SettingsPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;
      case 8:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = EventDetailsPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;
      case 9:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = CheckInpage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;

      case 10:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = SelfEnrollPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;

      case 11:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = SermonSeriesPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;

      case 12:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = PortalApplications(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
      // case 12:
      //   dynamic returnWidgetOptions;

      //   if (controller == Controller.Screen)
      //     returnWidgetOptions = ClassBuilder.fromString('EventDetailsPage');
      //   else if (controller == Controller.DashboardScreen)
      //     returnWidgetOptions = EventDetailsPage(
      //       onMenuPressedHere: onMenuPressed,
      //     );

      //   return returnWidgetOptions;
      //   break;
      case 13:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = PortalNotificationPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;
      case 14:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = AuthPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;

      case 15:
        dynamic returnWidgetOptions;

        //navigator(OldRoute) >>> Screen`
        //Screen >> DashboardScreen
        //DashboardScreen >>> NewRoute
        if (controller == Controller.Screen) //screen
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen) //dashboardscreen
          returnWidgetOptions = PortalPhotoGalleryPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator) //olderRoute
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;

      case 16:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = PortalVideoGalleryPage(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;

      case 17:
        dynamic returnWidgetOptions;

        var message = messagepass;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          //  if (message ==
          //     null) {
          //   ClassBuilder.fromString('DashboardScreen');
          // } else {

          returnWidgetOptions = PhotoFullScreen(
              //onMenuPressedHere: onMenuPressed,
              messagepass);
        //}
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                        messagepass: messagepass,
                      )));

        return returnWidgetOptions;
        break;
      case 18:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = PortalEventsScreen(
            onMenuPressedHere: onMenuPressed,
          );
        else if (controller == Controller.Navigator)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        selectionIndex: selection,
                      )));

        return returnWidgetOptions;
        break;

      default:
        return ClassBuilder.fromString('DashboardScreen');
        break;
    }
  }
}
