import '../Chapter.dart';
import 'package:flutter/material.dart';

abstract class IChapterElement {
  int? id;
  Chapter? chapter;
  List<IChapterElement> elements = <IChapterElement>[];

  IChapterElement({this.chapter, this.id});

  List<Text> toTextWidget(BuildContext context);

  InlineSpan toTextSpanWidget(BuildContext context);
}
