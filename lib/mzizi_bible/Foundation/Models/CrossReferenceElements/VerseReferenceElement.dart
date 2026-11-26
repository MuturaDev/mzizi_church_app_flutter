import 'package:mzizichurchsystem/mzizi_bible/Feature/InheritedBlocs.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/Models/CrossReferenceElements/ICrossReferenceElement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerseReferenceElement extends ICrossReferenceElement {
  String startingVerseId;
  String endingVerseId;

  VerseReferenceElement({text, required this.startingVerseId, required this.endingVerseId})
      : super(text: text);

  @override
  InlineSpan toInlineSpan(BuildContext context) {
    // TODO: implement toInlineSpan
    var span = TextSpan(
      children: [
        WidgetSpan(
            child: InkWell(
              onTap: () {
                HapticFeedback.vibrate();
                InheritedBlocs.of(context)
                    .openVerseReferenceInSheet(context, this);
              },
              child: Text(
                '''${this.text}''',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.blue,
                    ),
              ),
            ),
            alignment: PlaceholderAlignment.top)
      ],
    );

    return span;
  }
}
