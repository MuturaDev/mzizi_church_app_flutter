import 'package:mzizichurchsystem/mzizi_bible/Foundation/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'NoteTaker.dart';

class NoteTile extends StatefulWidget {
  const NoteTile({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  _NoteTileState createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  var _selected = false;

  @override
  Widget build(BuildContext context) {
    var lastUpdated = (widget.note.lastUpdated ?? DateTime.now()).toLocal();
    return Slidable(
      key: ValueKey(widget.note.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          // Note deletion was never implemented (the notes bloc has no delete).
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: Colors.redAccent.shade700,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        selected: _selected,
        onLongPress: () {
          setState(() {
            _selected = !_selected;
          });
        },
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return NotePage(
                note: widget.note,
              );
            },
          ),
        ),
        title: Text(widget.note.title ?? ''),
        subtitle:
            Text("${lastUpdated.month}/${lastUpdated.day}/${lastUpdated.year}"),
      ),
    );
  }
}
