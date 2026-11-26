import 'package:mzizichurchsystem/mzizi_bible/Feature/InheritedBlocs.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/foundation.dart';
import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({
    Key? key,
    required this.query,
    required this.books,
  }) : super(key: key);

  final String query;
  final List books;

  @override
  Widget build(BuildContext context) {
    final List<Book> filterItems = books.cast<Book>();
    Map<Book, int> filterMap = Map();

    for (Book item in filterItems.toSet()) {
      var numberOfOccurrences = filterItems.where((b) => b.name == item.name).length;
      filterMap[item] = numberOfOccurrences;
    }
    /*    for (int i = 0; i < list.Count; i++)
{
    //Get count of current element to before:
    int count = list.Take(i+1)
                    .Count(r => r.UserName == list[i].UserName);
    list[i].Count = count;
} */

    var filters = filterItems
        .toSet()
        .map(
          (b) => DropdownMenuItem(
                child: Text("${b.name} (${filterMap[b]})"),
                value: b.name,
              ),
        )
        .toList();

    filters.insert(
        0,
        DropdownMenuItem(
          child: Text("All (${books.length})"),
          value: "",
        ));
    return DropdownButton(
      hint: Text("Filter by book"),
      isExpanded: true,
      onChanged: (value) {
        InheritedBlocs.of(context)
            .searchBloc
            .searchTerm
            .add(SearchQuery(queryText: query, book: value ?? ''));
      },
      items: filters,
    );
  }
}
