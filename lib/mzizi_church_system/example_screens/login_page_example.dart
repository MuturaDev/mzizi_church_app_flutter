import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/login_progress_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/progress_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/signup_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/welcome_page.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/widdgets/bazierContainer.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/progress_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/authenicate_user_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_authentication_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/Screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';

TextEditingController usernameTextEditorController;
TextEditingController passwordTextEditorController;
TextEditingController churchCodeTextEditorController;

final formKey = GlobalKey<FormState>();
var isValid = false;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          isPassword
              ? PasswordWidget(controller)
              : TextFormField(
                  validator: (value) {
                    isValid = value.isEmpty ? false : true;
                    return value.isEmpty ? 'Field cannot be left empty.' : null;
                  },
                  controller: controller,
                  keyboardType: title == "Username"
                      ? TextInputType.text
                      : title == "Password"
                          ? TextInputType.text
                          : title == "Church Code"
                              ? TextInputType.number
                              : TextInputType.number,
                  autovalidate: false,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return LoginProgressButton();
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Log in with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xFF487890),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Mzizi',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xFF487890),
          ),
          children: [
            TextSpan(
              text: 'CMS',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: '',
              style: TextStyle(color: Color(0xFF487890), fontSize: 30),
            ),
          ]),
    );
  }

  static TextEditingController getUsernameController() {
    usernameTextEditorController = new TextEditingController();
    return usernameTextEditorController;
  }

  static TextEditingController getPasswordController() {
    passwordTextEditorController = new TextEditingController();
    return passwordTextEditorController;
  }

  static TextEditingController getChurchCodeController() {
    churchCodeTextEditorController = new TextEditingController();
    return churchCodeTextEditorController;
  }

  @override
  void initState() {
    super.initState();
    getUsernameController();
    getPasswordController();
    getChurchCodeController();
  }

  Widget _emailPasswordWidget() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          _entryField("Username", usernameTextEditorController),
          _entryField("Password", passwordTextEditorController,
              isPassword: true),
          _entryField("Church Code", churchCodeTextEditorController)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(),
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 10),
                  //   alignment: Alignment.centerRight,
                  //   child: Text('Forgot Password ?',
                  //       style: TextStyle(
                  //           fontSize: 14, fontWeight: FontWeight.w500)),
                  // ),
                  //  _divider(),
                  //  _facebookButton(),
                  // SizedBox(height: height * .055),
                  // _createAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
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

  Future<void> _authenticateUser() async {
    String username = usernameTextEditorController.text;
    String password = passwordTextEditorController.text;
    String churchCode = churchCodeTextEditorController.text;

    if (formKey.currentState.validate()) {
      AutheticateUser autheticateUser =
          new AutheticateUser(churchCode, username, password);

      if (await UtilityFunctions.checkConnection()) {
        setState(() {
          _buttonState = ButtonState.inProgress;
        });
        try {
          final dynamic authUser =
              await ApiController.sendRequestToAuthenticateUser(
                  autheticateUser);

          bool error = authUser != null;

          if (error) {
            //save to database15

            final AuthenticateUserDAO dao = new AuthenticateUserDAO();
            //Assign AuthenticateUser property values to AuthenticationUserResponse
            for (AuthenticationUserResponse value in authUser) {
              value.Password = autheticateUser.Password;
              value.Username = autheticateUser.Username;
              value.AppCode = autheticateUser.AppCode;
            }
            try {
              List<AuthenticationUserResponse> user = await dao.getUser();
              await dao.deleteUser(user);
              await dao.insertUser(authUser);
            } catch (e) {
              print(e);
            }

            // _progressDialog.update(
            //   progress: 50.0,
            //   message:
            //       "Please wait, fetching data from school.",
            //   progressWidget: Container(
            //       padding: EdgeInsets.all(8.0),
            //       child: CircularProgressIndicator()),
            //   maxProgress: 100.0,
            //   progressTextStyle: TextStyle(
            //       color: Colors.black,
            //       fontSize: 12.0,
            //       fontWeight: FontWeight.normal),
            //   messageTextStyle: TextStyle(
            //       color: Colors.black,
            //       fontSize: 12.0,
            //       fontWeight: FontWeight.normal),
            // );

            //OTHER REQUEST WILL HERE
            await fetchDataFromApi().then((value) {
              //removed for testing
              // if(value == null){
              //   showAlertDialog(context, 'Confirmation',
              //   'Please ensure your username, password and church code are correct.');
              //   return;
              // }

              setState(() {
                _buttonState = ButtonState.normal;
              });

              // await new Future.delayed(const Duration(seconds: 5));

              //greater than screen size of iphone 6
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => WelcomePage()));

              // RouteController.routeMethod(0,
              //     controller: Controller.Navigator, context: context);

            // RouteController.routeMethod(0,
            //                   controller: Controller.Screen, context: context);


            });
            // await Future.delayed(Duration(seconds: 3)).then((value){
            //         _progressDialog.dismiss();
            //         showAlertDialog(context ,'Confirmation', 'Data was fetched: ' + authUser.toString());
            //  });

            //This shows an errors, the dialog is not dismissed
            //  Future.delayed(Duration(seconds: 3)).then((value) {
            //     _progressDialog.hide().whenComplete(() {
            //
            //     });
            //   });
            //showAlertDialog(context,_progressDialog ,'Login Successfull', 'Please wait, fetching data from school');
          } else {
            setState(() {
              _buttonState = ButtonState.error;
            });

            showAlertDialog(context, 'Confirmation',
                'Please ensure your username, password and church code are correct.');
          }
        } catch (e) {
          setState(() {
            _buttonState = ButtonState.error;
          });
          showAlertDialog(context, 'Confirmation',
              'Please ensure your username, password and church code are correct.');
        }
      } else {
        setState(() {
          _buttonState = ButtonState.normal;
        });

        Fluttertoast.showToast(
            msg: "Ooops, check your internet connection.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 14.0);
      }
    }

    // Timer(Duration(seconds: 3), () {
    //   print("Yeah, this line is printed after 3 seconds");
    // });
    // sleep(const Duration(seconds: 5));
  }
}

Future<List<dynamic>> fetchDataFromApi() async {
  //TODO:fetch studen data, and assign it to the student podo
  final AuthenticateUserDAO dao = new AuthenticateUserDAO();
  List<AuthenticationUserResponse> studentDetails = await dao.getUser();

  if (studentDetails != null) {
    if (studentDetails.isNotEmpty) {
      AuthenticationUserResponse authStudent = studentDetails[0];

      Student student = new Student(authStudent.UserID, authStudent.AppCode);

      // {
      //   final dynamic transactions =
      //       await ApiController.sendRequestForPortalDetailedTransactions(
      //           student);

      //           PortalDetailedTransactionDAO dao =  new PortalDetailedTransactionDAO();
      //           await  dao.deletePortalDetailedTransaction(await dao.getPortalDetailedTransaction());

      //             await dao.insertPortalDetailedTransaction(transactions);

      //             List<PortalDetailedTransaction> transaction = await dao.getPortalDetailedTransaction();

      //             if(transaction.isNotEmpty){

      //             }
      // }

      // {
      //   final dynamic filteredStudentInfo =
      //       await ApiController.sendRequestForFIlteredStudentInfo(student);

      //       PortalFilteredStudentInfoDAO dao = new PortalFilteredStudentInfoDAO();
      //       await dao.deletePortalFilteredStudentInfoDAO(await dao.getPortalFilteredStudentInfoDAO());
      //       await dao.insertPortalFilteredStudentInfoDAO(filteredStudentInfo);
      // }

      // {
      //   final dynamic syncMyAccount =
      //       await ApiController.sendRequestForSyncMyAccount(student);

      //       PortalSyncMyAccountDAO dao = new PortalSyncMyAccountDAO();
      //       List<PortalSyncMyAccount> list =  await dao.getPortalSyncMyAccount();
      //       await dao.deletePortalSyncMyAccount(list);
      //        List<PortalSyncMyAccount> list2 =  await dao.getPortalSyncMyAccount();
      //       await dao.insertPortalSyncMyAccount(syncMyAccount);
      // }

      // PortalNotificationReadTracking msgRead = new P

      // final dynamic notificationReadTracking = await ApiController.sendRequestForPortalNotificationsReadTracking()
      // {
      //   await PackageInfo.fromPlatform()
      //       .then((PackageInfo packageInfo) async {

      //     String version = packageInfo.version;
      //     String buildNumber = packageInfo.buildNumber;

      //     MziziAppVersionRequest versionRequest =
      //         new MziziAppVersionRequest(version, buildNumber);

      //     final dynamic mziziAppVersion =
      //         await ApiController.sendRequestForMziziAppVersion(
      //             versionRequest);

      //     MziziAppVersionDAO dao =  new MziziAppVersionDAO();
      //     await dao.deleteAppVersion(await dao.getAppVersion());
      //     await dao.insertAppVersion(mziziAppVersion);
      //   });
      // }

      // {
      //   final dynamic contacts =
      //       await ApiController.sendRequestForPortalContacts(student);

      //   PortalContactsDAO dao = new PortalContactsDAO();
      //   await dao.deletePortalContacts(await dao.getPortalContacts());
      //   await dao.insertPortalContacts(contacts);
      // }

      // {
      //   List<PortalNotification> notificationList =
      //       await new PortalNotificationDAO().getLastNotification();
      //   if (notificationList.isNotEmpty) {
      //     for (PortalNotification notification in notificationList) {
      //       PortalNotificationRequest notificationRequest =
      //           new PortalNotificationRequest(authStudent.UserID,
      //               authStudent.AppCode, notification.MsgID as String);
      //       final dynamic notifications =
      //           await ApiController.sendRequestForPortalNotifications(
      //               notificationRequest);

      //       new PortalNotificationDAO()
      //           .insertPortalNotification(notifications);
      //     }
      //   } else {
      //     PortalNotificationRequest notificationRequest =
      //         new PortalNotificationRequest(
      //             authStudent.UserID, authStudent.AppCode, 0 as String);
      //     final dynamic notifications =
      //         await ApiController.sendRequestForPortalNotifications(
      //             notificationRequest);

      //     new PortalNotificationDAO().insertPortalNotification(notifications);
      //   }
      //}

      // {
      //   final dynamic siblings =
      //       await ApiController.sendRequestForPortalSiblings(student);

      //     PortalSiblingsDAO dao =  new PortalSiblingsDAO();
      //     await dao.deletePortalSiblings(await dao.getPortalContacts());
      //     await dao.insertPortalContacts(siblings);
      // }

      // {
      //   final dynamic examResults =
      //       await ApiController.sendRequestForPortalStudentDetailesResults(
      //           student);
      //       PortalStudentDetailedResultsDAO dao = new PortalStudentDetailedResultsDAO();
      //       await dao.deletePortalStudentDetailedResults(await dao.getPortalStudentDetailedResults());
      //       await dao.insertPortalStudentDetailedResults(examResults);
      // }

      //FIXME: This requires fixing since after getting data the from the api its not being saved right
      {
        // final List<PortalStudentInfo> studentInfo =
        //     await ApiController.sendRequestForportalStudentInfo(student);

        // PortalStudentInfoDAO dao = new PortalStudentInfoDAO();
        // await dao.deletePortalStudentInfo(await dao.getPortalStudentInfo());
        // await dao.insertPortalStudentInfo(studentInfo);

        // List<PortalStudentInfo> list = await dao.getPortalStudentInfo();

        // if (list.isNotEmpty) {
        //   return list;
        // }

        // return null;
      }

      // {
      //   final dynamic progressReport =
      //       await ApiController.sendRequestForPortalGetProgressReport(
      //           student);

      //       PortalStudentClassAttendanceDAO dao = new PortalStudentClassAttendanceDAO();
      //       await dao.deletePortalStudentClassAttendance(await dao.getPortalStudentClassAttendance());
      //       await dao.insertPortalStudentClassAttendance(progressReport);
      // }

      // {
      //   PortalStudentClassRequest attendanceRequest =
      //       new PortalStudentClassRequest(authStudent.UserID, 0 as String,
      //           0 as String, authStudent.OrganizationID, authStudent.AppCode);
      //   final dynamic classAttendance =
      //       await ApiController.sendRequestForPortalStudentAttendance(
      //           attendanceRequest);

      //   PortalStudentClassAttendanceDAO dao =  new PortalStudentClassAttendanceDAO();
      //   await dao.deletePortalStudentClassAttendance(await dao.getPortalStudentClassAttendance());
      //   await dao.insertPortalStudentClassAttendance(classAttendance);
      // }

      // {
      //   final dynamic events =
      //       await ApiController.sendRequestForPortalEvents(student);
      //   PortalEventsDAO dao = new PortalEventsDAO();
      //   await dao.deletePortalEvents(await dao.getPortalEvents());
      //   await dao.insertPortalEvents(events);
      // }
    }
  }

  //TODO:use the data to fetch from all apis
}

Future showAlertDialog(
  BuildContext context,
  String title,
  String content,
) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
          content: Text(
            content,
            // style: TextStyle(
            //     color: Colors.black,
            //     fontStyle: FontStyle.normal,
            //     fontWeight: FontWeight.normal,
            //     fontSize: 1.0),
          ),
          contentTextStyle: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              fontSize: 15.0),
          actions: <Widget>[
            FlatButton(
              child: Text('Try Again', style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontSize: 14.0),),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}

class PasswordWidget extends StatefulWidget {
  var controller;

  PasswordWidget(this.controller);

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  var _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          isValid = value.isEmpty ? false : true;
          return value.isEmpty ? 'Field cannot be left empty.' : null;
        },
        controller: widget.controller,
        autovalidate: false,
        obscureText: _passwordVisible,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility_off : Icons.visibility,
                color: Color(0xFF487890),
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            border: InputBorder.none,
            fillColor: Color(0xfff3f3f4),
            filled: true));
  }
}
