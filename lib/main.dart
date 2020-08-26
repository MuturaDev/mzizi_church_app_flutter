import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/drop_down_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/main_advance.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/main_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/main_gallery.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/main_lite.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/welcome_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/youtube_video_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/Screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/dashboard_screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/auth_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/check_in_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/give_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/more_announcements_details_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/photo_full_screen_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_application_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_photo_gallery_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/portal_video_gallery_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/tabs/sermon_series_tab.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/class_builder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ClassBuilder.registerClasses();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      title: 'Mzizi CMS',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: ExampleScreens(),
     //home: Screen(),
     
     //home: ExampleForm(),
    //home: SermonSeriesPage(),
     //home: YoutubeVideoExample(),
     //home: SermonNotesPage()

     home: WelcomePage(),
     //home: PortalApplications()
     //home: PortalMoreAnnouncementsDetails(),
     //home: AuthPage(),
     //home: PortalVideoGalleryPage(),
      //home: PortalPhotoGalleryPage(),
      //home: PhotoFullScreen(null),
    
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
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
