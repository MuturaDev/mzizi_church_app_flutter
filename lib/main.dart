import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/InheritedBlocs.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Navigation/navigation_bloc.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Notes/notes_bloc.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Search/search_bloc.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Settings/settings_bloc.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/Provider/MultiPartXmlBibleProvider.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/Provider/ReferenceProvider.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/Search/XmlBibleProvider.dart';
import 'package:mzizichurchsystem/mzizi_bible/Project/Designs/DarkDesign.dart';
import 'package:mzizichurchsystem/mzizi_bible/main_bible.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/date_picker_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/date_time_picker_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/drop_down_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/main_advance.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/main_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/main_gallery.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/main_lite.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/time-picker_screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/welcome_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/youtube_video_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/flavor_mzizi_church_system/flavour_config.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/Screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/dashboard_screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/auth_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/check_in_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/give_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/more_announcements_details_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/photo_full_screen_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/playstore_feature_update.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_application_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_chat_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_photo_gallery_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_video_gallery_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/sermon_series_tab.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/class_builder.dart';


import 'mzizi_bible/Feature/Reader/bible_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ClassBuilder.registerClasses();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GlobalConfiguration().loadFromAsset("app_settings");

  //mainbible();

  FlavourConfig(
    flavour: Flavour.mzizicms,
    values: const FlavourValues(currentFlavour: 'MziziCMS'),
  );

  bool isMzizicms = FlavourConfig.isMzizicms();

  /// Is the app in `staging` phase.
  bool isBwmc = FlavourConfig.isBwmc();

  /// Is the app in `production` phase.
  bool isDcik = FlavourConfig.isDcik();

  bool isJcc = FlavourConfig.isJcc();

//INFO: USED FOR TESTING
 //runApp(MyApp());

  runApp(Phoenix(child: MyApp(bibleBloc: BibleBloc(
                                    MultiPartXmlBibleProvider(),
                                    ReferenceProvider()),
                                settingsBloc: SettingsBloc(),)));
}

class MyApp extends StatelessWidget {
  final bibleBloc;
  final settingsBloc;

  MyApp({this.bibleBloc, this.settingsBloc});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          // statusBarColor is used to set Status bar color in Android devices.
          statusBarColor: Color(0xFF487890),
          // To make Status bar icons color white in Android devices.
          statusBarIconBrightness: Brightness.dark,
          // statusBarBrightness is used to set Status bar icon color in iOS.
          statusBarBrightness: Brightness.dark
          // Here light means dark color Status bar icons.
          ));
    }

    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          // statusBarColor is used to set Status bar color in Android devices.
          // statusBarColor: Color,
          // To make Status bar icons color white in Android devices.
          statusBarIconBrightness: Brightness.light,
          // statusBarBrightness is used to set Status bar icon color in iOS.
          statusBarBrightness: Brightness.light
          // Here light means dark color Status bar icons.
          ));
    }

    //INFO: USED FOR TESTING
    // return MaterialApp(
    //     home: Scaffold(
    //   body: BWMCWebView(),
    //   //body: WelcomePage(),
    // ));

    return InheritedBlocs(
      bibleBloc: bibleBloc,
      settingsBloc: settingsBloc,
      notesBloc: NotesBloc(),
      navigationBloc: NavigationBloc(),
      searchBloc: SearchBloc(XmlBibleProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        showSemanticsDebugger: false,
        theme: Designs.getDarkTheme(),
        title: FlavourConfig.isBwmc()
            ? 'BWMC'
            : FlavourConfig.isDcik()
                ? 'DCIK'
                : FlavourConfig.isJcc()
                    ? 'JCC'
                    : FlavourConfig.isMzizicms() ? 'MziziCMS' : 'MziziCMS',
        // theme: ThemeData(
        //   // This is the theme of your application.
        // //https://stackoverflow.com/questions/50321182/how-to-customize-a-date-picker
        //   colorScheme: ColorScheme.light(primary: const Color(0xFF487890)),

        //   // Try running your application with "flutter run". You'll see the
        //   // application has a blue toolbar. Then, without quitting the app, try
        //   // changing the primarySwatch below to Colors.green and then invoke
        //   // "hot reload" (press "r" in the console where you ran "flutter run",
        //   // or simply save your changes to "hot reload" in a Flutter IDE).
        //   // Notice that the counter didn't reset back to zero; the application
        //   // is not restarted.

        // ),
        //home: ExampleScreens(),
        //home: Screen(),

        //home: ExampleForm(),
        //home: SermonSeriesPage(),
        //home: YoutubeVideoExample(),
        //home: SermonNotesPage()
        //home: PortalChatPage()
        home: WelcomePage(),
        //home: PortalApplications()
        //home: PortalMoreAnnouncementsDetails(),
        //home: AuthPage(),
        //home: PortalVideoGalleryPage(),
        //home: PortalPhotoGalleryPage(),
        //home: PhotoFullScreen(null),
        //home: DatePickerBottomSheet()
        //home:MyApp2(),
        //home:TimePickerScreen()
      ),
    );
  }
}

//LEFT DRAWER NAVIGATION EXAMPLE

//BOTTOM NAVIGATION EXAMPLE
class ExampleScreens extends StatefulWidget {
  @override
  _ExampleScreensState createState() => _ExampleScreensState();
}

class _ExampleScreensState extends State<ExampleScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TabPage()));
                  },
                  child: Text("Main_advance")),
              SizedBox(height: 10),
              FlatButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text("Main_gallery")),
              SizedBox(height: 10),
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage2()));
                  },
                  child: Text("Main_lite")),
              SizedBox(height: 10),
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Example()));
                  },
                  child: Text("Main")),
            ],
          ),
        ),
      )),
    );
  }
}
