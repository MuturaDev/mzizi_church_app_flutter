import 'dart:io';

import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/progress_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/login_page_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_church_services_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/service_types_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_widgets.dart';

class PortalApplications extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  PortalApplications({this.onMenuPressedHere});
  @override
  _PortalApplicationsState createState() => _PortalApplicationsState();
}

class _PortalApplicationsState extends State<PortalApplications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
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
          title: Text('Church Service Booking',
              style: TextStyle(
                fontSize: 20,
              )),
          centerTitle: true,
        ),
        body: Container(
          color: Color(0xFF487890),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Container(
                color: Color(0xFF487890),
                child: EnhancedFutureBuilder(
                    future: ApiController.sendRequestForPortalChurchServices(),
                    rememberFutureResult: true,
                    whenDone: (dynamic churchServicesList) {
                      return EnhancedFutureBuilder(
                          future:
                              ApiController.sendRequestForPortalServiceTypes(),
                          rememberFutureResult: true,
                          whenDone: (dynamic serviceTypesList) {
                            return body(churchServicesList, serviceTypesList);
                          },
                          whenNotDone: Center(
                            child: Image.asset(
                                'assets/images/member_app_assets/Curve-Loading.gif'),
                          ));
                    },
                    whenNotDone: Center(
                      child: Image.asset(
                          'assets/images/member_app_assets/Curve-Loading.gif'),
                    ))),
          ),
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController dateBookedController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();

  static var serviceTpes = <String>[
    'Select Service Type',
    'One',
    'Two',
    'Free',
    'Four'
  ];
  static var churchServices = <String>[
    'Select Church Service',
    'One',
    'Two',
    'Free',
    'Four'
  ];

  String selectedServiceType = 'Select Service Type';
  String selectedChurchService = 'Select Church Service';

  Widget body(List<PortalChurchServices> churchServiceList,
      List<ServiceTypesModel> serviceTypeList) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(
        child: Container(
            child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                left: 5,
                right: 5,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 70, bottom: 15, right: 5, left: 5),
                  child: Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 30, bottom: 10, right: 10, left: 10),
                        width: double.infinity,
                        height: 450,
                        child: serviceBookingSection(
                            churchServiceList, serviceTypeList),
                      )),
                )),
            Positioned(
              top: 20,
              left: 10,
              right: 10,
              child: Container(
                width: 100,
                height: 100,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child:
                      Image.asset('assets/images/member_app_assets/church.png'),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget serviceBookingSection(List<PortalChurchServices> churchServiceList,
      List<ServiceTypesModel> serviceTypeList) {
    var _showCapacityInstru = true;

    return Form(
      key: _formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            IgnorePointer(
              ignoring: _showCapacityInstru,
              child: AnimatedOpacity(
                opacity: _showCapacityInstru ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: Container(
                    child: Text(
                  '0/100',
                  style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                )),
              ),
            ),
            //https://stackoverflow.com/questions/54606771/animate-show-or-hide-widgets-with-flutter
            IgnorePointer(
              ignoring: _showCapacityInstru,
              child: AnimatedOpacity(
                opacity: _showCapacityInstru ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: Container(
                    child: RichText(
                        text: TextSpan(
                            text: '',
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                            children: <TextSpan>[
                      TextSpan(
                        text: 'Available slots for the selected service',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0),
                      )
                    ]))),
              ),
            ),
            SizedBox(height: 20),

            CustomTextFormField(
              labelText: 'Church Service Date',
              controller: dateBookedController,
            ),
            SizedBox(height: 10),
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
                            value: selectedServiceType,
                            icon: Icon(Icons.backspace, color: Colors.white),
                            iconSize: 24,
                            elevation: 5,
                            style: TextStyle(color: Colors.grey),
                            underline: Container(
                              height: 2,
                              color: Colors.grey,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                selectedServiceType = newValue;
                              });
                            },
                            items: serviceTpes
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Container(child: Icon(Icons.arrow_drop_down)),
                  ],
                )),
            SizedBox(height: 10),
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
                            value: selectedChurchService,
                            icon: Icon(Icons.backspace, color: Colors.white),
                            iconSize: 24,
                            elevation: 2,
                            style: TextStyle(color: Colors.grey),
                            underline: Container(
                              height: 2,
                              color: Colors.grey,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                selectedChurchService = newValue;
                              });
                            },
                            items: churchServices
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Container(child: Icon(Icons.arrow_drop_down)),
                  ],
                )),
            SizedBox(height: 10),
            CustomTextFormField(
              labelText: 'Age',
              controller: ageController,
            ),
            SizedBox(height: 10),
            // RaisedButton(
            //   onPressed: () {
            //     if (_formKey.currentState.validate()) {}
            //   },
            //   textColor: Color(0xFF487890),
            //   child: Container(
            //     child: Text('Apply'),
            //   ),
            // )
            SizedBox(height: 10),
            LoginProgressButton()
          ]),
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
      height: 50,
      child: ProgressButton(
        child: Text(
          'Login',
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

  void setPasswordAfterSetState() {
    usernameTextEditorController.text = usernameTextEditorController.text;
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

//capy
