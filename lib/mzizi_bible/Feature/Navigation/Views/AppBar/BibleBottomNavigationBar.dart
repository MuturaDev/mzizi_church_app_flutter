import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/InheritedBlocs.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Reader/reader_feature.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Search/search_feature.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/Screen.dart';

import '../../AppPages.dart';

class BibleBottomNavigationBar extends StatelessWidget {
  BibleBottomNavigationBar({
    Key key,
    BuildContext context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppPage>(
        stream: InheritedBlocs.of(context).navigationBloc.currentPage,
        initialData: AppPage.readerPage,
        builder: (context, snapshot) {
          int lastPage = snapshot.data.index;
          return Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              //fixedColor: Colors.white,
             selectedItemColor: Colors.white,
              currentIndex: snapshot.data.index,
              onTap: (index) {
                if (index == AppPage.readerPage.index) {
                  if (lastPage == index) {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(child: BooksList());
                        });
                  } else {
                    // if (Navigator.of(context).canPop()) {
                    //   Navigator.of(context).pop();
                    // }
                    InheritedBlocs.of(context)
                        .navigationBloc
                        .nextPage
                        .add(AppPage.readerPage);
                  }
                } else if (index == AppPage.notesPage.index) {
                  // if (Navigator.of(context).canPop()) {
                  //   Navigator.of(context).pop();
                  // }
                  InheritedBlocs.of(context)
                      .navigationBloc
                      .nextPage
                      .add(AppPage.notesPage);
                } else if (index == AppPage.searchPage.index) {
                  // if (Navigator.of(context).canPop()) {
                  //   Navigator.of(context).pop();
                  // }
                  InheritedBlocs.of(context)
                      .navigationBloc
                      .nextPage
                      .add(AppPage.searchPage);
                  showSearch(
                    context: context,
                    delegate: BibleSearchDelegate(),
                  );
                } else if (index == AppPage.historyPage.index) {
                  // if (lastPage == index) {
                  // } else {
                  InheritedBlocs.of(context)
                      .navigationBloc
                      .nextPage
                      .add(AppPage.historyPage);
                  // }
                } else if (index == AppPage.mziziHome.index) {
                  //Navigator.of(context).pop(true);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen(selectionIndex: 0),
                      ));
                  // Phoenix.rebirth(context);
                }
              },
              items: [
                BottomNavigationBarItem(
                  title: Text("Bible"),
                  icon: Icon(Icons.library_books),
                ),
                BottomNavigationBarItem(
                  title: Text("Notes"),
                  icon: Icon(MdiIcons.notebook),
                ),
                BottomNavigationBarItem(
                  title: Text("Search"),
                  icon: Icon(Icons.search),
                ),
                BottomNavigationBarItem(
                  title: Text("History"),
                  icon: Icon(Icons.history),
                ),
                BottomNavigationBarItem(
                  title: Text("Home"),
                  icon: Icon(Icons.home),
                ),
              ],
            ),
          );
        });
  }
}
