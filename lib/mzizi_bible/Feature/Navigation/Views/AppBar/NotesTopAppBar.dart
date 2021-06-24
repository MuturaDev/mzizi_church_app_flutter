import 'package:flutter/material.dart';

class NotesTopAppBar extends StatelessWidget {
  const NotesTopAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      centerTitle: true,
      automaticallyImplyLeading: false,
       backgroundColor: Color(0xFF487890),
      title: Text("Notes"),
    );
  }
}
