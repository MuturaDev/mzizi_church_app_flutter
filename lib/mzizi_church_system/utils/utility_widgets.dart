import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/flavor_mzizi_church_system/flavour_config.dart';
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
      {this.initialValue = '',
      this.labelText,
      this.controller,
      this.enabled = true,
      this.text,
      this.keyboardType = TextInputType.text,
      this.onTap});
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

class AnimateImage extends StatefulWidget {
  @override
  _AnimateImageState createState() => _AnimateImageState();
}

class _AnimateImageState extends State<AnimateImage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..addListener(() => setState(() {}));

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 0.0),
          child: Image(
            height: 200,
            width: 200,
            image: AssetImage(FlavourConfig.isBwmc()
                ? 'assets/images/member_app_assets/bwmc.png'
                : FlavourConfig.isDcik()
                    ? 'assets/images/member_app_assets/dcik.png'
                    : FlavourConfig.isJcc()
                        ? 'assets/images/member_app_assets/jcc.png'
                        : FlavourConfig.isMzizicms()
                            ? 'assets/images/member_app_assets/church_logo_no_bg2.png'
                            : 'assets/images/member_app_assets/church_logo_no_bg2.png'),
          ),
        ),
      ),
    );
  }
}
