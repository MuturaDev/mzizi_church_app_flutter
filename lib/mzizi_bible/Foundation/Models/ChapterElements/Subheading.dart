import 'package:flutter/material.dart';

import 'IChapterElement.dart';
class Subheading extends IChapterElement {
  final String text;

  Subheading({required this.text}) : super();

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
          text: '''${this.text}\n\r''',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontStyle: FontStyle.italic,
              ),
        ),
      ],
    );
    return span;
  }
}
