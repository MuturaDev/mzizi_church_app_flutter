import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/main.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/google_bottom_navigation.dart';

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  int selectedIndex = 0;

  List<GButton> tabs = new List();
  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600],
    Colors.teal
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lite"),
         leading: FlatButton(onPressed: (){
            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ExampleScreens()));
          }, child: Icon(Icons.backspace)),
      ),
        backgroundColor: Colors.white,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          color: colors[selectedIndex],
          child: Center(
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 60,
                    color: Colors.black.withOpacity(.20),
                    offset: Offset(0, 15))
              ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
                child: GNav(
                    gap: 8,
                    color: Colors.grey[800],
                    activeColor: Colors.purple,
                    iconSize: 24,
                    tabBackgroundColor: Colors.purple.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    duration: Duration(milliseconds: 1000),
                    tabs: [
                      GButton(
                        icon: LineIcons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: LineIcons.heart_o,
                        text: 'Likes',
                      ),
                      GButton(
                        icon: LineIcons.search,
                        text: 'Search',
                      ),
                      GButton(
                        icon: LineIcons.user,
                        text: 'Profile',
                      )
                    ],
                    selectedIndex: selectedIndex,
                    onTabChange: (index) {
                      print(index);
                      setState(() {
                        selectedIndex = index;
                      });
                    }),
              ),
            ),
          ),
        ));
  }
}