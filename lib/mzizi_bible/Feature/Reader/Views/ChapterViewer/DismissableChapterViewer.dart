import 'package:mzizichurchsystem/mzizi_bible/Feature/InheritedBlocs.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/foundation.dart';
import 'package:flutter/material.dart';

import 'VerseText.dart';

class DismissableChapterViewer extends StatelessWidget {
  final Chapter chapter;
  final Chapter previousChapter;
  final Chapter nextChapter;
  final Book book;
  final int? verseNumber;
  final bool shouldHaveBackgrounds;
  final bool showVerseNumbers;
  final Function scrollToVerseMethod;
  final bool showReferences;

  DismissableChapterViewer({
    required this.chapter,
    required this.book,
    required this.shouldHaveBackgrounds,
    required this.showVerseNumbers,
    this.verseNumber,
    required this.scrollToVerseMethod,
    required this.previousChapter,
    required this.nextChapter,
    required this.showReferences,
  });

  Widget build(BuildContext context) {
    return Dismissible(
      secondaryBackground: this.shouldHaveBackgrounds
          ? VerseText(
              book: book,
              chapter: nextChapter,
              verseNumber: 1,
              scrollToVerseMethod: scrollToVerseMethod,
              showReferences: this.showReferences,
            )
          : LoadingColumn(),
      background: this.shouldHaveBackgrounds
          ? VerseText(
              book: book,
              chapter: previousChapter,
              verseNumber: 1,
              scrollToVerseMethod: scrollToVerseMethod,
              showReferences: this.showReferences,
            )
          : LoadingColumn(),
      resizeDuration: null,
      onDismissed: (DismissDirection swipeDetails) async {
        if (swipeDetails == DismissDirection.endToStart) {
          InheritedBlocs.of(context).bibleBloc.goToNextChapter(this.chapter);
        } else {
          InheritedBlocs.of(context)
              .bibleBloc
              .goToPreviousChapter(this.chapter);
        }
      },
      child: VerseText(
        book: book,
        chapter: chapter,
        verseNumber: verseNumber,
        scrollToVerseMethod: scrollToVerseMethod,
        showReferences: this.showReferences,
      ),
      key: ValueKey(chapter.number),
    );
  }
}
