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
import 'package:mzizichurchsystem/mzizi_church_system/tabs/notifications_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_chat_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/sermon_series_tab.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/settings_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/class_builder.dart';

enum Controller { Screen, DashboardScreen, Navigator }

class RouteController {
  static dynamic routeMethod(int selection,
      {Controller controller = Controller.DashboardScreen,
      VoidCallback onMenuPressed,
      BuildContext context}) {
    ClassBuilder.registerClasses(routePage: selection);

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
      case 2:
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

      case 3:
        dynamic returnWidgetOptions;

        if (controller == Controller.Screen)
          returnWidgetOptions = ClassBuilder.fromString('DashboardScreen');
        else if (controller == Controller.DashboardScreen)
          returnWidgetOptions = AnnouncementDetailsPage(
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
          returnWidgetOptions = CalendarPage(
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

      default:
        return ClassBuilder.fromString('DashboardScreen');
        break;
    }
  }
}
