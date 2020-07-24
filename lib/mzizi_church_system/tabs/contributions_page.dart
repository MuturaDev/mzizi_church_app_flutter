import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';

class PortalContributionsPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;

  PortalContributionsPage({this.onMenuPressedHere});

  @override
  _PortalContributionsPageState createState() =>
      _PortalContributionsPageState();
}

class _PortalContributionsPageState extends State<PortalContributionsPage> {
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
          title: Text('Contributions',
              style: TextStyle(
                fontSize: 15,
              )),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[makePredgeWidget()],
          ),
        ),
      ),
    );
  }

  List<String> spinnerResponse = <String>[
    "Select type by tapping on X, to the right",
    "CONSTRUCTION PROJECT",
    "TITHE",
  ];

  String _dropDownText;
  String _dropDownID;

  Widget makePredgeWidget() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 300,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Center(
                        child: Text("Make a pledge",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black))),
                  ),
                  SizedBox(height: 10),
                  DropDownField(
                      value: spinnerResponse[0],
                      icon: Icon(FontAwesomeIcons.gift),
                      required: true,
                      hintText: 'Select type',
                      labelText: 'Pledge For *',
                      items: spinnerResponse,
                      strict: true,
                      setter: (dynamic newValue) {
                        _dropDownText= newValue;
                        for(String spinner in spinnerResponse){}
                        //_dropDownText= 
                      }),
                ]),
          )),
    );
  }
}
