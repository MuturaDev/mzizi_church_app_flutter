import 'dart:async';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Notes/notes_bloc.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/Models/Note.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/Provider/INotesProvider.dart';
import 'package:zefyr/zefyr.dart';
//import 'package:notus/notus.dart';

class TestNotesProvider extends INotesProvider {
  List<Note> _notes = List<Note>();
  @override
  Future<List<Note>> getNotes() {
    var completer = Completer<List<Note>>();
    _notes.add(
      Note(
          doc: NotusDocument(),
          //doc: "",
          id: 0,
          lastUpdated: DateTime.now().subtract(Duration(days: 2)),
          title: "test note"),
    );
    completer.complete(_notes);

    return completer.future;
  }

  @override
  Future saveNotes(List<Note> notes) async {
    _notes = notes;
  }
}
