import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Navigation/navigation_feature.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/foundation.dart';

import '../../InheritedBlocs.dart';

/// Rich-text note editor (flutter_quill; previously zefyr).
class NotePage extends StatefulWidget {
  final Note note;

  const NotePage({super.key, required this.note});

  @override
  NotePageState createState() => NotePageState();
}

class NotePageState extends State<NotePage> {
  late final QuillController _controller;
  late final FocusNode _focusNode;
  StreamSubscription<DocChange>? _changes;

  Note get note => widget.note;

  @override
  void initState() {
    super.initState();
    _controller = QuillController(
      document: note.doc,
      selection: const TextSelection.collapsed(offset: 0),
    );
    _focusNode = FocusNode();
    _changes = _controller.changes.listen((change) {
      if (change.source != ChangeSource.local) return;
      note.lastUpdated = DateTime.now();
      InheritedBlocs.of(context).notesBloc.addUpdateNote.add(note);
    });
  }

  @override
  void dispose() {
    _changes?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title ?? ''),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.view_agenda),
            onPressed: () async {
              ChapterReference reference = await InheritedBlocs.of(context)
                  .bibleBloc
                  .chapterReference
                  .first;
              if (!context.mounted) return;
              InheritedBlocs.of(context)
                  .bibleBloc
                  .currentPopupChapterReference
                  .add(reference);
              InheritedBlocs.of(context)
                  .showReferenceInBottomSheet(context)
                  .then((shouldReturnToReader) {
                if (!context.mounted) return;
                Navigator.of(context).pop();
                InheritedBlocs.of(context)
                    .navigationBloc
                    .nextPage
                    .add(AppPage.readerPage);
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            QuillSimpleToolbar(controller: _controller),
            Expanded(
              child: QuillEditor.basic(
                controller: _controller,
                focusNode: _focusNode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
