import 'dart:async';

import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/login_page_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/signup_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/flavor_mzizi_church_system/flavour_config.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_authentication_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/screens/Screen.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_widgets.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xFF487890).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Color(0xFF487890)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Quick login with Touch ID',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(Icons.fingerprint, size: 90, color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              'Touch ID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: FlavourConfig.isBwmc()
              ? 'The Bible '
              : FlavourConfig.isDcik()
                  ? 'Deliverance Church '
                  : FlavourConfig.isJcc()
                      ? 'Jubilee Christian '
                      : FlavourConfig.isMzizicms() ? 'Mzizi' : 'Mzizi',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: FlavourConfig.isBwmc()
                  ? ' Way Ministries'
                  : FlavourConfig.isDcik()
                      ? ' International Kasarani'
                      : FlavourConfig.isJcc()
                          ? ' Church'
                          : FlavourConfig.isMzizicms() ? 'CMS' : 'CMS',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: '',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  Future<bool> _isUserLoggedIn() async {
    bool isUserLoggedIn = false;
    final AuthenticateUserDAO dao = new AuthenticateUserDAO();
    try {
      List<AuthenticationUserResponse> authUserList = await dao.getUser();
      if (authUserList.isNotEmpty) {
        isUserLoggedIn = true;
      }
    } catch (e) {
      throw (e);
    }

    await UtilityFunctions.checkConnection(context: context);

    return isUserLoggedIn;
  }

  void navigationPage() async {
    if (await _isUserLoggedIn()) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Screen(selectionIndex: 0),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    startTime() async {
      var _duration = new Duration(seconds: 4);
      return new Timer(_duration, navigationPage);
    }

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      //Color(0xFF7DACC6),
                      Color.fromRGBO(255, 255, 255, 1.0),
                      Color(0xFF487890),
                    ])),
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 100,
                    right: 5,
                    left: 5,
                    //bottom: ,
                    child: AnimateImage()),
                Positioned(
                  top: 90,
                  right: 5,
                  left: 5,
                  bottom: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _title(),
                      SizedBox(
                        height: 80,
                      ),
                      EnhancedFutureBuilder(
                          future: _isUserLoggedIn(),
                          rememberFutureResult: false,
                          whenDone: (dynamic data) {
                            Widget returnWidget;

                            if (data) {
                              startTime();
                              returnWidget = Container();
                            } else {
                              returnWidget = _submitButton();
                            }

                            return returnWidget;
                          },
                          whenNotDone: Container()),
                      SizedBox(
                        height: 20,
                      ),
                      // _signUpButton(),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // _label()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
