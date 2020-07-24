import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/progress_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/login_page_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/authenicate_user_request_model.dart';

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
          setState(() {
            _buttonState = ButtonState.inProgress;
          });

          await _authenticateUser();

          setState(() {
            _buttonState = ButtonState.error;
          });
        },
        buttonState: _buttonState,
        backgroundColor: Theme.of(context).primaryColor,
        progressColor: Colors.white,
      ),
    );
  }

  Future<void> _authenticateUser() async {

    // String username = getUsernameController().text.toString();
    // String password = getPasswordController().text.toString();

    // AutheticateUser credentials = new AutheticateUser(
    //   churchCodeTextEditorController.value.toString(),
    //   usernameTextEditorController.value.toString(),
    //   passwordTextEditorController.value.toString());


     
    // Timer(Duration(seconds: 3), () {
    //   print("Yeah, this line is printed after 3 seconds");
    // });
    // sleep(const Duration(seconds: 5));
    await new Future.delayed(const Duration(seconds: 5));
  }

  
}
