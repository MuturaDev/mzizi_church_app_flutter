import 'package:flutter/material.dart';
import 'IChapterElement.dart';

class Heading extends IChapterElement {
  final String text;

  Heading({required this.text}) : super();

  @override
  List<Text> toTextWidget(BuildContext context) {
    return [
      Text(
        this.text + '''\n''',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    ];
  }

  @override
  InlineSpan toTextSpanWidget(BuildContext context) {
    var span = TextSpan(
      children: [
        TextSpan(
          text: "\n\r" + this.text + "\n\r",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
              ),
        ),
      ],
    );
    return span;
  }
}
