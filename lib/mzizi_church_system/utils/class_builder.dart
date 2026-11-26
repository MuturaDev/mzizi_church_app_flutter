import 'package:mzizichurchsystem/mzizi_church_system/screens/dashboard_screen.dart';



typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T extends Object>(Constructor<T> constructor) {
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
    return _constructors[type]!();
  }
}
