import 'package:flutter_quill/flutter_quill.dart';

class Note {
  String? title;
  DateTime? lastUpdated;
  final int? id;
  Document doc;
  Note({this.id, this.title, Document? doc, this.lastUpdated})
      : doc = doc ?? Document();
}
