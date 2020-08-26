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
          title: Text('Make a pledge',
              style: TextStyle(
                fontSize: 20,
              )),
          centerTitle: true,
        ),
        body: Container(
          color: Color(0xFF487890),
          child: makePredgeWidget(),
        ),
      ),
    );
  }

  var churchServices = <String>[
    'Pledge For',
    "CONSTRUCTION PROJECT",
    "TITHE",
  ];

  var dropDownValue = "One";
  final _formKey = GlobalKey<FormState>();

  Widget makePredgeWidget() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 30,
          left: 5,
          right: 5,
          child: Container(
            padding: EdgeInsets.only(top: 70, bottom: 10, right: 5, left: 5),
            child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 400,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Container(
                        //   child: Center(
                        //       child: Text("Make a pledge",
                        //           style:
                        //               TextStyle(fontSize: 20, color: Colors.black))),
                        // ),
                        SizedBox(height: 50),
                        Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  child: DropdownButton<String>(
                                    value: churchServices[0],
                                    icon: Icon(Icons.backspace,
                                        color: Colors.white),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.grey),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.grey,
                                    ),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropDownValue = newValue;
                                      });
                                    },
                                    items: churchServices
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(child: Icon(Icons.arrow_drop_down)),
                              ],
                            )),
                        SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                              initialValue: '',
                              autovalidate: false,
                              validator: (dynamic value) {
                                if (value.isEmpty) {
                                  return 'Please input the amount';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Amount',
                                //errorText: 'Please input the amount',
                                border: OutlineInputBorder(),
                                // suffixIcon: Icon(
                                //   Icons.error,
                                // )),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          color: Color(0xFF487890),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {}
                          },
                          textColor: Colors.white,
                          child: Container(
                            margin: EdgeInsets.only(left: 40, right: 40),
                            width: double.infinity,
                            child: Center(child: Text('Apply')),
                          ),
                        )
                      ]),
                )),
          ),
        ),
        Positioned(
          top: 50,
          left: 10,
          right: 10,
          child: Container(
            width: 100,
            height: 100,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(FontAwesomeIcons.heart, color: Color(0xFF487890), size: 50,),
          ),
        ),
      ],
    );
  }
}
