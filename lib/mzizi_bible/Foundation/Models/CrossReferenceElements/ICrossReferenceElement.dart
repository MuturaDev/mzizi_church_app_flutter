import 'package:flutter/cupertino.dart';

abstract class ICrossReferenceElement {
  String text;

  ICrossReferenceElement({required this.text});

  InlineSpan toInlineSpan(BuildContext context);
}
