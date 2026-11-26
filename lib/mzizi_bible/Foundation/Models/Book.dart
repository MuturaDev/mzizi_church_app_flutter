import 'Chapter.dart';

class Book {
  late int id;
  final String name;
  List<Chapter>? chapters;
  final int? number;

  Book({required this.name, this.chapters, this.number});
}
