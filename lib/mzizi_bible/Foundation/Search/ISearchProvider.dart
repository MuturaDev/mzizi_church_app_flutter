import 'package:mzizichurchsystem/mzizi_bible/Foundation/Models/ChapterElements/Verse.dart';

abstract class ISearchProvider {
  Future<List<Verse>> getSearchResults(
      String searchTerm, List<String> booksToSearch);

  Future init();
}
