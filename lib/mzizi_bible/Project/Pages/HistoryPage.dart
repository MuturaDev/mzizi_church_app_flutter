import 'package:mzizichurchsystem/mzizi_bible/Feature/History/Views/HistoryIndex.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/InheritedBlocs.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Navigation/navigation_feature.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:notus/notus.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HistoryIndex(),
      bottomNavigationBar: BibleBottomNavigationBar(context: context),
    );
  }
}
