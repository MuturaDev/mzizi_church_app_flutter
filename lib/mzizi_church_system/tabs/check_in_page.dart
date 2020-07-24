import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';

class CheckInpage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  CheckInpage({this.onMenuPressedHere});

  @override
  _CheckInpageState createState() => _CheckInpageState();
}

class _CheckInpageState extends State<CheckInpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF487890),
          primary: true,
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            child: Material(
              shadowColor: Colors.transparent,
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: widget.onMenuPressedHere != null
                    ? widget.onMenuPressedHere
                    : widget.onMenuPressed,
              ),
            ),
          ),
          title: Text('CHECK IN',
              style: TextStyle(
                fontSize: 15,
              )),
              centerTitle: true,
          actions: <Widget>[
            SpringButton(
              SpringButtonType.OnlyScale,
              Container(
                child: Icon(LineIcons.paper_plane),
              ),
              onTapDown: (_) {},
            ),
            SizedBox(width: 10),
            Container(
                child: FaIcon(FontAwesomeIcons.donate, size: 20, color: Colors.red,),
              ),
            SpringButton(
              SpringButtonType.OnlyScale,
              Container(
                child: Icon(Icons.refresh),
              ),
              onTapDown: (_) {},
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}
