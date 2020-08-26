import 'dart:io';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/progress_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_widgets.dart';

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
    "Pledge For",
    "CONSTRUCTION PROJECT",
    "TITHE",
  ];

  var selectedChargeType = "Pledge For";

  var dropDownValue = "One";
  final _formKey = GlobalKey<FormState>();

  TextEditingController amountController = new TextEditingController();

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
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: selectedChargeType,
                                        icon: Icon(Icons.backspace,
                                            color: Colors.white),
                                        iconSize: 24,
                                        elevation: 5,
                                        style: TextStyle(color: Colors.grey),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            selectedChargeType = newValue;
                                          });
                                        },
                                        items: churchServices
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(child: Icon(Icons.arrow_drop_down)),
                              ],
                            )),
                        SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: CustomTextFormField(
                            labelText: 'Amount',
                            controller: amountController,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                         LoginProgressButton()
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
            child: Icon(
              FontAwesomeIcons.heart,
              color: Color(0xFF487890),
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}


class LoginProgressButton extends StatefulWidget {
  @override
  _LoginProgressButtonState createState() => _LoginProgressButtonState();
}

class _LoginProgressButtonState extends State<LoginProgressButton> {
  var _buttonState = ButtonState.normal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ProgressButton(
        child: Text(
          'Apply',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () async {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }

          await _authenticateUser();
        },
        buttonState: _buttonState,
        backgroundColor: Theme.of(context).primaryColor,
        progressColor: Colors.white,
      ),
    );
  }



  Future<void> _authenticateUser() async {
    // String username = usernameTextEditorController.text;
    // String password = passwordTextEditorController.text;
    // String churchCode = churchCodeTextEditorController.text;

    // if (formKey.currentState.validate()) {
    //   AutheticateUser autheticateUser =
    //       new AutheticateUser(churchCode, username, password);

    //   if (await UtilityFunctions.checkConnection()) {
    //     setState(() {
    //       setPasswordAfterSetState();
    //       _buttonState = ButtonState.inProgress;
    //     });
    //     try {
    //       final dynamic authUser =
    //           await ApiController.sendRequestToAuthenticateUser(
    //               autheticateUser);

    //       bool error = authUser != null;

    //       if (error) {
    //         //save to database15

    //         final AuthenticateUserDAO dao = new AuthenticateUserDAO();
    //         //Assign AuthenticateUser property values to AuthenticationUserResponse
    //         for (AuthenticationUserResponse value in authUser) {
    //           value.Password = autheticateUser.Password;
    //           value.Username = autheticateUser.Username;
    //           value.AppCode = autheticateUser.AppCode;
    //         }
    //         try {
    //           List<AuthenticationUserResponse> user = await dao.getUser();
    //           await dao.deleteUser(user);
    //           await dao.insertUser(authUser);
    //         } catch (e) {
    //           print(e);
    //         }

    //         // _progressDialog.update(
    //         //   progress: 50.0,
    //         //   message:
    //         //       "Please wait, fetching data from school.",
    //         //   progressWidget: Container(
    //         //       padding: EdgeInsets.all(8.0),
    //         //       child: CircularProgressIndicator()),
    //         //   maxProgress: 100.0,
    //         //   progressTextStyle: TextStyle(
    //         //       color: Colors.black,
    //         //       fontSize: 12.0,
    //         //       fontWeight: FontWeight.normal),
    //         //   messageTextStyle: TextStyle(
    //         //       color: Colors.black,
    //         //       fontSize: 12.0,
    //         //       fontWeight: FontWeight.normal),
    //         // );

    //         //OTHER REQUEST WILL HERE
    //         await fetchDataFromApi().then((value) {
    //           //removed for testing
    //           // if(value == null){
    //           //   showAlertDialog(context, 'Confirmation',
    //           //   'Please ensure your username, password and church code are correct.');
    //           //   return;
    //           // }

    //           setState(() {
    //             setPasswordAfterSetState();
    //             _buttonState = ButtonState.normal;
    //           });

    //           // await new Future.delayed(const Duration(seconds: 5));

    //           //greater than screen size of iphone 6
    //           Navigator.pushReplacement(
    //               context, MaterialPageRoute(builder: (context) => Screen()));
    //         });
    //         // await Future.delayed(Duration(seconds: 3)).then((value){
    //         //         _progressDialog.dismiss();
    //         //         showAlertDialog(context ,'Confirmation', 'Data was fetched: ' + authUser.toString());
    //         //  });

    //         //This shows an errors, the dialog is not dismissed
    //         //  Future.delayed(Duration(seconds: 3)).then((value) {
    //         //     _progressDialog.hide().whenComplete(() {
    //         //
    //         //     });
    //         //   });
    //         //showAlertDialog(context,_progressDialog ,'Login Successfull', 'Please wait, fetching data from school');
    //       } else {
    //         setState(() {
    //           setPasswordAfterSetState();
    //           _buttonState = ButtonState.error;
    //         });

    //         showAlertDialog(context, 'Confirmation',
    //             'Please ensure your username, password and church code are correct.');
    //       }
    //     } catch (e) {
    //       setState(() {
    //         setPasswordAfterSetState();
    //         _buttonState = ButtonState.error;
    //       });
    //       showAlertDialog(context, 'Confirmation',
    //           'Please ensure your username, password and church code are correct.');
    //     }
    //   } else {
    //     setState(() {
    //       setPasswordAfterSetState();
    //       _buttonState = ButtonState.normal;
    //     });

    //     Fluttertoast.showToast(
    //         msg: "Ooops, check your internet connection.",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.BOTTOM,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 14.0);
    //   }
    //}

    // Timer(Duration(seconds: 3), () {
    //   print("Yeah, this line is printed after 3 seconds");
    // });

    setState(() {
      //setPasswordAfterSetState();
      _buttonState = ButtonState.inProgress;
    });

    sleep(const Duration(seconds: 5));
  }
}
