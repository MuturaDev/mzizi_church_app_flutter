import 'package:mzizichurchsystem/mzizi_church_system/screens/dashboard_screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/calendar_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/dashboard.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/home_page.dart';

import 'package:mzizichurchsystem/mzizi_church_system/tabs/main_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/settings_page.dart';

import 'package:mzizichurchsystem/mzizi_church_system/tabs/announcements_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/auth_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/check_in_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/contact_info_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/detailed_transactions_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/events_tap.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/notifications_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_chat_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/sermon_series_tab.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses({int routePage = 0, dynamic messagepass}) {
    // register<MainPage>(() => MainPage());
    register<DashboardScreen>(() =>
        DashboardScreen(selectedIndex: routePage, messagepass: messagepass));
    // register<Dashboard>(()=> Dashboard());
    // register<CalendarPage>(() => CalendarPage());
    // register<SettingsPage>(() => SettingsPage());

    // register<HomePage>(() => HomePage());
    // register<AuthPage>(() => AuthPage());
    // register<CheckInpage>(() => CheckInpage());
    // register<AnnouncementDetailsPage>(() => AnnouncementDetailsPage());
    // register<PortalContactInfoPage>(() => PortalContactInfoPage());
    // register<EventDetailsPage>(() => EventDetailsPage());
    // register<PortalDetailedTransactionsPage>(() => PortalDetailedTransactionsPage());
    // register<PortalChatPage>(() => PortalChatPage());
    // register<SermonSeriesPage>(() => SermonSeriesPage());
    // register<EventDetailsPage>(() => EventDetailsPage());
    // register<PortalNotificationPage>(() => PortalNotificationPage());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
