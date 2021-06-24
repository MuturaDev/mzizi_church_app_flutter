import 'package:mzizichurchsystem/mzizi_bible/Feature/Reader/reader_feature.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Search/search_feature.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Settings/Views/SettingPopupMenu.dart';
import 'package:flutter/material.dart';

class BibleReaderAppBar extends StatelessWidget {
  final String title;
  const BibleReaderAppBar({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      automaticallyImplyLeading: false,
       backgroundColor: Color(0xFF487890),
      //  leading: IconButton(
      //   icon: Icon(Icons.search, color: Colors.blue),
      //   onPressed: (){},
      //   // onPressed: () => showSearch(
      //   //       context: context,
      //   //       delegate: BibleSearchDelegate(),
      //   //     ),
      // ),
      title: GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(child: BooksList());
              });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      /* actions: <Widget>[
         IconButton(
          icon: Icon(Icons.search),
          onPressed: () => showSearch(
                context: context,
                delegate: BibleSearchDelegate(),
              ),
        ),
      ],*/
      actions: <Widget>[
        SettingsPopupMenu(),
      ],
    );
  }
}
