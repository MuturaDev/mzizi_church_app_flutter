import 'dart:async';
import 'dart:io';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/home_recent_transactions.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/progress_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/login_page_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/make_a_pledge_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/charge_type_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_widgets.dart';
import 'package:sweetalert/sweetalert.dart';

class PortalContributionsPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;

  PortalContributionsPage({this.onMenuPressedHere});

  @override
  _PortalContributionsPageState createState() =>
      _PortalContributionsPageState();
}

TextEditingController amountController = new TextEditingController();
var selectedChargeType = "";
final _formKey = GlobalKey<FormState>();
List<PortalChargeTypeResponseModel> responseList;

class _PortalContributionsPageState extends State<PortalContributionsPage> {
  static TextEditingController getAmountController() {
    amountController = new TextEditingController();
    return amountController;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAmountController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    amountController.dispose();
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
      ),
    );
  }

  Widget makePredgeWidget() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    EdgeInsets.only(top: 60, bottom: 10, right: 5, left: 5),
                child: Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 280,
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
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                padding: EdgeInsets.only(left: 10, right: 10),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                        child: EnhancedFutureBuilder(
                                            future: ApiController
                                                .sendRequestForPortalChargeTypes(),
                                            rememberFutureResult: true,
                                            whenDone: (dynamic data) {
                                              responseList = data;
                                              if (selectedChargeType.isEmpty) {
                                                selectedChargeType =
                                                    responseList[0].ID;
                                              }

                                              return Container(
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    value: selectedChargeType,
                                                    icon: Icon(Icons.backspace,
                                                        color: Colors.white),
                                                    iconSize: 24,
                                                    elevation: 5,
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                    underline: Container(
                                                      height: 2,
                                                      color: Colors.grey,
                                                    ),
                                                    onChanged:
                                                        (String newValue) {
                                                      setState(() {
                                                        selectedChargeType =
                                                            newValue;
                                                      });
                                                    },
                                                    items: responseList.map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (PortalChargeTypeResponseModel
                                                            value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value.ID,
                                                        child: Text(
                                                          value.ChargeTypeName,
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              );
                                            },
                                            whenNotDone: Container(
                                              height: 60,
                                              color: Colors.white,
                                              child: Center(
                                                child: Image.asset(
                                                    'assets/images/member_app_assets/Curve-Loading.gif'),
                                              ),
                                            ))),
                                    SizedBox(height: 10),
                                    Container(
                                        child: Icon(Icons.arrow_drop_down)),
                                  ],
                                )),
                            SizedBox(height: 20),
                            Form(
                              key: _formKey,
                              child: TextFormField(
                                  readOnly: false,
                                  enableInteractiveSelection: true,
                                  // onTap: onTap,
                                  controller: amountController,
                                  //initialValue: initialValue,
                                  enabled: true,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  autovalidate: false,
                                  validator: (dynamic value) {
                                    if (value.isEmpty) {
                                      return 'Please provide a value for ' +
                                          "Amount" +
                                          '';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Amount",
                                    labelStyle: TextStyle(fontSize: 15),
                                    //errorText: isValid ? 'Please provide your firstname' : null,
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(
                                      Icons.error,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            LoginProgressButton(this)
                          ]),
                    )),
              ),
            ),
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
                child: Icon(
                  FontAwesomeIcons.heart,
                  color: Color(0xFF487890),
                  size: 50,
                ),
              ),
            ),
            Positioned(
              top: 350,
              right: 0,
              left: 0,
              //bottom: 10,
              child: Container(
                padding: EdgeInsets.only(top: 0, bottom: 0, right: 5, left: 5),
                child: Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.only(top:5,right:5,left:5,bottom:10),
                      width: double.infinity,
                      //height: 230,
                      child: HomeRecentPledgeContributions(
                        showTopSection: false,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginProgressButton extends StatefulWidget {
  _PortalContributionsPageState parent;
  LoginProgressButton(this.parent);
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
          'Pledge',
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
        myColor: false,
        backgroundColor: Theme.of(context).primaryColor,
        progressColor: Colors.white,
      ),
    );
  }

  Future<void> _authenticateUser() async {
    String amount = amountController.text;
    String chargeTypeID = selectedChargeType;
    String chargeTypeName = "";

    if (await UtilityFunctions.checkConnection()) {
      if (amount.isNotEmpty &&
          chargeTypeID != "-1" &&
          double.parse(amount) > 0) {
        setState(() {
          //setPasswordAfterSetState();
          _buttonState = ButtonState.inProgress;
        });

        for (PortalChargeTypeResponseModel chargeType in responseList) {
          if (chargeType.ID == chargeTypeID) {
            chargeTypeName = chargeType.ChargeTypeName;
            break;
          }
        }

        Student student = await AuthenticateUserDAO().getStudent();
        final dynamic auth = await AuthenticateUserDAO().getUser();

        PortalMakeAPledge payload = new PortalMakeAPledge(
            student.StudentID,
            chargeTypeName,
            amount,
            "1",
            DateTime.now().year.toString(),
            "D",
            "1",
            chargeTypeName,
            auth[0].AppCode);

        //try {
        var response = await ApiController.sendRequestForContributions(payload);
        if (response["StatusCode"] == "200") {
          setState(() {
            amountController.text = '';
            selectedChargeType = responseList[0].ID;
            SweetAlert.show(context,
                title: "Successful",
                subtitle: response["Message"],
                style: SweetAlertStyle.success);
            _buttonState = ButtonState.normal;
          });
          //resent the parent
          widget.parent.setState(() {});
        } else {
          setState(() {
            SweetAlert.show(context,
                title: "Unsuccessful",
                subtitle: response["Message"],
                style: SweetAlertStyle.error);
            _buttonState = ButtonState.error;
          });
        }
        //} catch (e) {

        // }

        // Timer(Duration(seconds: 3), () {
        //   setState(() {

        //     SweetAlert.show(context,
        //         title: amount,
        //         subtitle: chargeTypeID,
        //         style: SweetAlertStyle.success);

        //     _buttonState = ButtonState.normal;
        //   });

        //RouteController.routeMethod(1, controller: Controller.Navigator);

      } else {
        String above = "";
        if (amount.isNotEmpty)
          above = double.parse(amount) <= 0
              ? ' Provide the correct amount above: ' + amount
              : '';

        if (chargeTypeID == "-1")
          above = "Fields cannot be left empty." + above;

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

    //if (formKey.currentState.validate()) {
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

    //sleep(const Duration(seconds: 5));
  }
}
