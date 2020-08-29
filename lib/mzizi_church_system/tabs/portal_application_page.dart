import 'dart:async';
import 'dart:io';

import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/progress_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dummy_json_test/dummy_json.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/login_page_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/self_enroll_application_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_church_services_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/service_types_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_widgets.dart';
import 'package:sweetalert/sweetalert.dart';

class PortalApplications extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  PortalApplications({this.onMenuPressedHere});
  @override
  _PortalApplicationsState createState() => _PortalApplicationsState();
}

final _formKey = GlobalKey<FormState>();

TextEditingController dateBookedController = new TextEditingController();
TextEditingController ageController = new TextEditingController();

String selectedServiceType = "";
String selectedChurchService = "";
var _showCapacityInstru = false;
String serviceCapcity = "0/100";

dynamic servicesList;

//DATE PICKER
DateTime _dateTime;

class _PortalApplicationsState extends State<PortalApplications> {
  static TextEditingController getDateBookedController() {
    dateBookedController = new TextEditingController();
    return dateBookedController;
  }

  static TextEditingController getAgeController() {
    ageController = new TextEditingController();
    return ageController;
  }

  static const int saturday = 7;

  int daysToAdd(int todayIndex, int targetIndex) {
    if (todayIndex < targetIndex) {
      // jump to target day in same week
      return targetIndex - todayIndex;
    } else if (todayIndex > targetIndex) {
      // must jump to next week
      return 7 + targetIndex - todayIndex;
    } else {
      return 0; // date is matched
    }
  }

  DateTime defineInitialDate() {
    DateTime now = DateTime.now();
    int dayOffset = daysToAdd(now.weekday, saturday);
    return now.add(Duration(days: dayOffset));
  }

  bool defineSelectable(DateTime val) {
    DateTime now = DateTime.now();

    if (val.isBefore(now)) {
      return false;
    }

    switch (val.weekday) {
      case saturday:
        return true;
        break;
      default:
        return false;
    }
  }

  void handleButton(context) async {
    DateTime chosenDate = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(2100),
      initialDate: defineInitialDate(),
      selectableDayPredicate: defineSelectable,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
              // buttonTheme: ButtonThemeData(
              //     textTheme: const Color(0xFF487890), //color of the text in the button "OK/CANCEL"
              //     ),
              colorScheme: ColorScheme.light(primary: const Color(0xFF487890)),
              // primarySwatch: Color(0xFF487890),//OK/Cancel button text color
              primaryColor: const Color(0xFF487890), //Head background
              accentColor: const Color(0xFF487890) //selection color
              //dialogBackgroundColor: Colors.white,//Background color
              ),
          child: child,
        );
      },
    );

    if (chosenDate != null) {
      setState(() {
        _dateTime = chosenDate;
        dateBookedController.text = UtilityFunctions.formatDate(
            '${_dateTime.month.toString().padLeft(2, '0')}.${_dateTime.day.toString().padLeft(2, '0')}.${_dateTime.year}');
      });
    }
    //if (chosenDate != null) print("R: ${chosenDate.toLocal()}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDateBookedController();
    getAgeController();

    _dateTime = defineInitialDate();
    dateBookedController.text = UtilityFunctions.formatDate(
        '${_dateTime.month.toString().padLeft(2, '0')}.${_dateTime.day.toString().padLeft(2, '0')}.${_dateTime.year}');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dateBookedController.dispose();
    ageController.dispose();
  }

  Future<bool> _onBackPressed() {
    RouteController.routeMethod(0,
        controller: Controller.Navigator, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: _onBackPressed,
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
            child: Container(
                color: Color(0xFF487890),
                child: EnhancedFutureBuilder(
                    future: ApiController.sendRequestForPortalServiceTypes(),
                    rememberFutureResult: true,
                    whenDone: (dynamic serviceTypesList) {
                      return EnhancedFutureBuilder(
                          future:
                              ApiController.sendRequestForPortalChurchServices(
                                  _dateTime, selectedServiceType),
                          rememberFutureResult: false,
                          whenDone: (dynamic churchServicesList) {
                            servicesList = churchServicesList;
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

  Widget body(List<PortalChurchServices> churchServiceList,
      List<ServiceTypesModel> serviceTypeList) {
    return Container(
      child: Container(
        child: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 5,
                      right: 5,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 70, bottom: 15, right: 5, left: 5),
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
                        child: Image.asset(
                            'assets/images/member_app_assets/church.png'),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget serviceBookingSection(List<PortalChurchServices> churchServiceList,
      List<ServiceTypesModel> serviceTypeList) {
    // String whole = churchServiceList[1].ServiceDescription.split('-')[0] +
    //     '\n-' +
    //     churchServiceList[1].ServiceDescription.split('-')[1];

    if (selectedChurchService.isEmpty) {
      selectedChurchService = churchServiceList[0].ID;
    }

    if (selectedServiceType.isEmpty) {
      selectedServiceType = serviceTypeList[0].ID;
    }

    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
          Widget>[
        SizedBox(height: 10),
        IgnorePointer(
          ignoring: _showCapacityInstru,
          child: AnimatedOpacity(
            opacity: _showCapacityInstru ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: Container(
                child: Text(
              serviceCapcity,
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
        // CustomTextFormField(
        //     labelText: 'Church Service Date',
        //     controller: dateBookedController,
        //     enabled: true,
        //     onTap: (){
        //       setState(() {
        //         _showCapacityInstru = !_showCapacityInstru;
        //       });
        //     },
        //   ),

        TextFormField(
            readOnly: true,
            enableInteractiveSelection: true,
            onTap: () {
              handleButton(context);
            },
            controller: dateBookedController,
            //initialValue: ,
            enabled: true,
            //keyboardType: keyboardType,
            style: TextStyle(fontSize: 15, color: Colors.black),
            autovalidate: false,
            validator: (dynamic value) {
              if (value.isEmpty) {
                return 'Please provide a value for ' + "Age" + '';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Church Service Date",
              labelStyle: TextStyle(fontSize: 15),
              //errorText: isValid ? 'Please provide your firstname' : null,
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.error,
              ),
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
                        items: serviceTypeList.map<DropdownMenuItem<String>>(
                            (ServiceTypesModel value) {
                          return DropdownMenuItem<String>(
                            value: value.ID,
                            child: Text(
                              value.Name,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
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
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(right: 30),
                    //width: 200,
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
                            _showCapacityInstru = true;

                            for (var obj in churchServiceList) {
                              if (obj.ID == newValue) {
                                serviceCapcity = obj.Capacity + '/' + '100';
                                break;
                              }
                            }
                          });
                        },
                        items: churchServiceList.map<DropdownMenuItem<String>>(
                            (PortalChurchServices value) {
                          return DropdownMenuItem<String>(
                            value: value.ID,
                            child: Text(
                              value.ServiceDescription.contains('-')
                                  ? value.ServiceDescription.split('-')[0] +
                                      '\n-' +
                                      value.ServiceDescription.split('-')[1]
                                  : value.ServiceDescription,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
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
        TextFormField(
            readOnly: false,
            enableInteractiveSelection: true,
            onTap: () {},
            controller: ageController,
            //initialValue: initialValue,
            enabled: true,
            //keyboardType: keyboardType,
            style: TextStyle(fontSize: 15, color: Colors.black),
            autovalidate: false,
            validator: (dynamic value) {
              if (value.isEmpty) {
                return 'Please provide a value for ' +
                    "Church Service Date" +
                    '';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Age",
              labelStyle: TextStyle(fontSize: 15),
              //errorText: isValid ? 'Please provide your firstname' : null,
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.error,
              ),
            )),
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
      height: 40,
      child: ProgressButton(
        child: Text(
          'Book Service',
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
    String dateBooked = dateBookedController.text;
    String age = ageController.text;
    String selectServiceType = selectedServiceType;
    String selectChurchService = selectedChurchService;

    if (await UtilityFunctions.checkConnection()) {
      if (dateBooked.isNotEmpty &&
          age.isNotEmpty &&
          selectServiceType != "-1" &&
          selectChurchService != "-1") {
        setState(() {
          //setPasswordAfterSetState();
          _buttonState = ButtonState.inProgress;
        });

        // Timer(Duration(seconds: 3), () {
        //   setState(() {
        //     SweetAlert.show(context,
        //         title: dateBooked,
        //         subtitle:
        //         'Feature Coming Soon...',
        //             //age + ' ' + selectServiceType + ' ' + selectChurchService,
        //         style: SweetAlertStyle.success);
        //     _buttonState = ButtonState.normal;
        //   });

        //RouteController.routeMethod(1, controller: Controller.Navigator);
        // });

        String startTime = "";

        for (PortalChurchServices service in servicesList) {
          if (service.ID == selectChurchService) {
            startTime = service.StartTime;
            break;
          }
        }

        //Student student = await AuthenticateUserDAO().getStudent();
        final dynamic auth = await AuthenticateUserDAO().getUser();

        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formatted = formatter.format(_dateTime);

        PortalSelfEnrollApplication payload = new PortalSelfEnrollApplication(
            dateBooked,
            startTime,
            age,
            selectChurchService,
            auth[0].OrganizationID,
            formatted,
            auth[0].UserID);

        int dkdk = 90;
      } else {
        String above = "Fields cannot be left empty.";
        final snackBar = SnackBar(content: Text('' + above));

        // Find the Scaffold in the widget tree and use it to show a SnackBar.
        Scaffold.of(context).showSnackBar(snackBar);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Ooops, check your internet connection.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
    }

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
  }
}

//capy
