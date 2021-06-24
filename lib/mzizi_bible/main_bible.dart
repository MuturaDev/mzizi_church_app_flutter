import 'package:mzizichurchsystem/mzizi_bible/Feature/InheritedBlocs.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Navigation/navigation_feature.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Notes/notes_feature.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Reader/reader_feature.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Search/search_feature.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Settings/settings_feature.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/Provider/ReferenceProvider.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/foundation.dart';
import 'package:mzizichurchsystem/mzizi_bible/Project/Designs/DarkDesign.dart';
import 'package:mzizichurchsystem/mzizi_bible/Project/Pages/NotesPage.dart';
import 'package:mzizichurchsystem/mzizi_bible/Project/Pages/ReaderPage.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:mzizichurchsystem/mzizi_church_system/flavor_mzizi_church_system/flavour_config.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/Screen.dart';

import 'Project/Pages/HistoryPage.dart';

// void mainbible() async {
//  // WidgetsFlutterBinding.ensureInitialized();
//   await GlobalConfiguration().loadFromAsset("app_settings");
//   //final bibleBloc = BibleBloc(MultiPartXmlBibleProvider(), ReferenceProvider());

//   // Navigator.push(
//   //   context,
//   //   MaterialPageRoute(builder: (context) => SecondRoute()),
//   // );

//   runApp(MainBible(
//     bibleBloc: BibleBloc(MultiPartXmlBibleProvider(), ReferenceProvider()),
//     settingsBloc: SettingsBloc(),
//   ));

//   //runApp(NotesPage());
// }

class MainBible extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MainBibleHomePage();
  }
}

class MainBibleHomePage extends StatefulWidget {
  MainBibleHomePage({Key key}) : super(key: key);

  @override
  _MainBibleHomePageState createState() => _MainBibleHomePageState();
}

class _MainBibleHomePageState extends State<MainBibleHomePage> {
  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Screen(selectionIndex: 0),
        ));
    // return showDialog(
    //       context: context,
    //       builder: (context) => new AlertDialog(
    //         title: new Text('Are you sure?'),
    //         content: new Text('Do you want to exit an App'),
    //         actions: <Widget>[
    //           new GestureDetector(
    //             onTap: () => Navigator.of(context).pop(false),
    //             child: Container(
    //                 padding: EdgeInsets.all(5),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(5),
    //                     color: Color(0xFF487890)),
    //                 child: Text("NO")),
    //           ),
    //           SizedBox(height: 16),
    //           new GestureDetector(
    //             onTap: () => Navigator.of(context).pop(true),
    //             child: Container(
    //                 padding: EdgeInsets.all(5),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(5),
    //                     color: Color(0xFF487890)),
    //                 child: Text("YES")),
    //           ),
    //         ],
    //       ),
    //     ) ??
    //     false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          body: StreamBuilder<AppPage>(
            stream: InheritedBlocs.of(context).navigationBloc.currentPage,
            builder: (context, currentPageSnapshot) {
              switch (currentPageSnapshot.data) {
                case AppPage.readerPage:
                  return ReaderPage();
                  break;

                case AppPage.notesPage:
                  return NotesPage();
                  break;

                case AppPage.historyPage:
                  return HistoryPage();
                  break;
                default:
                  return ReaderPage();
                  break;
              }
            },
            initialData: null,
          ),
        ),
      ),
    );
  }
}
