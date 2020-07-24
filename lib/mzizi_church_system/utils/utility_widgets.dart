import 'package:flutter/material.dart';

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