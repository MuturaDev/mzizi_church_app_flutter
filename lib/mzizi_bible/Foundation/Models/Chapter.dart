import 'Book.dart';
import 'ChapterElements/IChapterElement.dart';

class Chapter {
  late int id;
  List<IChapterElement>? elements;
  Book? book;
  int number;
  String? referenceName;

  Chapter({required this.number, this.elements, this.book, this.referenceName}) {
    if (this.elements == null) {
      elements = <IChapterElement>[];
    }
  }

  @override
  String toString() {
    return "${book!.name} $number";
  }

  @override
  int get hashCode {
    return ("${book!.name} + $number").hashCode;
  }

  operator ==(Object other) => hashCode == other.hashCode;
}
