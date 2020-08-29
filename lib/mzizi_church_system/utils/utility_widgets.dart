import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HighlightAndCopyText extends StatelessWidget {
  final String textToHighLight;
  final TextStyle style;

  HighlightAndCopyText(this.textToHighLight, {this.style});

  @override
  Widget build(BuildContext context) {
    return
        //SelectableText(this.textToHighLight, style: this.style, textAlign: TextAlign.start,);
        Text(
      this.textToHighLight,
      style: this.style,
      textAlign: TextAlign.end,
    );
  }
}

class LinkTextSpan extends TextSpan {
  LinkTextSpan({TextStyle style, String url, String text})
      : super(
            style: style,
            text: text ?? url,
            recognizer: new TapGestureRecognizer()
              ..onTap = () {
                launch(url);
              });
}

class CustomTextFormField extends StatelessWidget {
  String initialValue;
  String labelText;
  TextEditingController controller;
  TextInputType keyboardType;
  bool enabled;
  VoidCallback onTap;
  String text;


  CustomTextFormField(
      {this.initialValue= '',
      this.labelText,
      this.controller,
      this.enabled = true,
      this.text,
      this.keyboardType = TextInputType.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      child: TextFormField(
         readOnly: enabled,
  enableInteractiveSelection: true,
        onTap: onTap,
          controller: controller,
          initialValue: initialValue,
         enabled: true,
          keyboardType: keyboardType,
          style: TextStyle(fontSize: 14, color: Colors.black),
          autovalidate: false,
          validator: (dynamic value) {
            if (value.isEmpty) {
              return 'Please provide a value for ' + labelText + '';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 15),
            //errorText: isValid ? 'Please provide your firstname' : null,
            border: OutlineInputBorder(),
            suffixIcon: Icon(
              Icons.error,
            ),
          )),
    );
  }
}
