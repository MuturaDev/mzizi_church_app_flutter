import 'dart:collection';
import 'package:mzizichurchsystem/mzizi_bible/Feature/InheritedBlocs.dart';
import 'package:mzizichurchsystem/mzizi_bible/Feature/Navigation/Views/AppBar/BibleBottomNavigationBar.dart';
import 'package:mzizichurchsystem/mzizi_bible/Foundation/foundation.dart';
import 'package:flutter/material.dart';

import 'SearchFilter.dart';
import 'SearchResults.dart';

class BibleSearchDelegate extends SearchDelegate<Chapter?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      body: searchResultsBody(context: context),
      /* bottomNavigationBar: BibleBottomNavigationBar(
        context: context,
      ), */
    );
  }

  Widget searchResultsBody({required BuildContext context}) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
              textScaleFactor: 1.2,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  !.copyWith(color: Colors.red.shade300),
            ),
          ),
          //BibleBottomNavigationBar(),
        ],
      );
    }
    InheritedBlocs.of(context)
        .searchBloc
        .searchTerm
        .add(SearchQuery(queryText: query, book: ""));

    InheritedBlocs.of(context)
        .searchBloc
        .suggestionSearchTerm
        .add(SearchQuery(queryText: query, book: ""));

    return Column(
      children: <Widget>[
        StreamBuilder<UnmodifiableListView<Verse>>(
          stream: InheritedBlocs.of(context)
              .searchBloc
              .suggestionSearchearchResults,
          initialData: UnmodifiableListView([]),
          builder: (BuildContext context,
              AsyncSnapshot<UnmodifiableListView<Verse>> snapshot) {
            if (!snapshot.hasData || snapshot.data!.length == 0) {
              return Container();
            }
            final books = snapshot.data!
                .map((verse) => verse.chapter!.book)
                .toList();
            return Padding(
              padding: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 0.0),
              child: SearchFilter(query: query, books: books),
            );
          },
        ),
        StreamBuilder<UnmodifiableListView<Verse>>(
          stream: InheritedBlocs.of(context).searchBloc.searchResults,
          builder: (BuildContext context,
              AsyncSnapshot<UnmodifiableListView<Verse>> snapshot) {
            if (!snapshot.hasData || snapshot.data!.length == 0) {
              return Row();
            }
            return Padding(
              padding: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "${snapshot.data!.length} Results",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  snapshot.data!
                              .map((v) => v.chapter!.book)
                              .toSet()
                              .length >
                          1
                      ? Text("")
                      : Text(
                          " in ${snapshot.data!.first.chapter!.book!.name}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                ],
              ),
            );
          }, initialData: null,
        ),
        Divider(),
        StreamBuilder<UnmodifiableListView<Verse>>(
          stream: InheritedBlocs.of(context).searchBloc.searchResults,
          builder:
              (context, AsyncSnapshot<UnmodifiableListView<Verse>> snapshot) {
            if (!snapshot.hasData) {
              return LoadingColumn();
            } else if (snapshot.data!.length == 0) {
              return Column(
                children: <Widget>[
                  Text(
                    "No Results Found.",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        !.copyWith(color: Colors.red.shade300),
                  ),
                ],
              );
            } else {
              final results = snapshot.data;
              return SearchResults(results: results!);
            }
          }, initialData: null,
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      //body: Column(),
       bottomNavigationBar: BibleBottomNavigationBar(
        context: context,
      ), 
    );
  }
}
