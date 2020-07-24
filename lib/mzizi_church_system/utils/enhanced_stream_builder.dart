

import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_parent_chat_response_model.dart';


class EnhancedStreamBuilder extends StatefulWidget {

  /// Future to resolve.
  final Stream<List<ParentChatResponse>> stream;
  /// Whether or not the future result should be stored.
  final bool rememberStreamResult;
  /// Widget to display when connected to an asynchronous computation.
  final Widget whenActive;
  /// Widget to display when connected to an asynchronous computation and awaiting interaction.
  final Widget whenWaiting;
  /// Widget to display when not connected to n asynchronous computation.
  final Widget whenNone;
  /// Widget to display when the asynchronous computation is not done yet.
  final Widget whenNotDone;
  /// Function to call when the asynchronous computation is done.
  final Widget Function(dynamic snapshotData) whenDone;
  /// The data that will be used until a non-null [future] has completed.
  ///
  /// See [FutureBuilder] for more info
  final Stream<List<ParentChatResponse>> initialData;

   const EnhancedStreamBuilder({
    Key key, 
    @required this.stream,
    @required this.rememberStreamResult,
    @required this.whenDone,
    this.whenActive,
    this.whenNotDone,
    this.whenNone,
    this.whenWaiting,
    this.initialData
  }) : 
  assert(stream != null),
  assert(rememberStreamResult != null), 
  assert(whenDone != null), 
  super(key: key);


  @override
  _EnhancedStreamBuilderState createState() => _EnhancedStreamBuilderState();
}

class _EnhancedStreamBuilderState extends State<EnhancedStreamBuilder> {

  Stream<List<ParentChatResponse>> _cachedFuture;

  @override 
  void initState() {
    super.initState();
    _cachedFuture = this.widget.stream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: this.widget.rememberStreamResult ? _cachedFuture : this.widget.stream,
      //initialData: this.widget.initialData,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        Widget returnWidget;
        if (this.widget.whenActive != null && snapshot.connectionState == ConnectionState.active) {
          returnWidget = this.widget.whenActive;
        }
        
        if (this.widget.whenNone != null && snapshot.connectionState == ConnectionState.none) {
          returnWidget =  this.widget.whenNone;
        }
        
        if (this.widget.whenWaiting != null && snapshot.connectionState == ConnectionState.waiting) {
          returnWidget =  this.widget.whenWaiting;
        }

        //changed from done
        if (this.widget.whenDone != null && snapshot.connectionState == ConnectionState.active) {
          returnWidget =  this.widget.whenDone(snapshot.data);
        }

        //changed from ...snapshot.connectionState != ConnectionState.done
        if (this.widget.whenNotDone != null && snapshot.connectionState == ConnectionState.waiting) {
          returnWidget =  this.widget.whenNotDone;
        }

        return returnWidget;
      },
    );
  }
}