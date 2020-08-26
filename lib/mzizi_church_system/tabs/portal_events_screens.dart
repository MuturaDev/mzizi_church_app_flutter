import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_events_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';

class PortalEventsScreen extends KFDrawerContent {
  final VoidCallback onMenuPressedHere;

  PortalEventsScreen({this.onMenuPressedHere});

  @override
  _PortalEventsScreenState createState() => _PortalEventsScreenState();
}

class _PortalEventsScreenState extends State<PortalEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF487890),
          primary: true,
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            child: Material(
              shadowColor: Colors.transparent,
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: widget.onMenuPressedHere != null
                    ? widget.onMenuPressedHere
                    : widget.onMenuPressed,
              ),
            ),
          ),
          title: Text('Upcoming Events',
              style: TextStyle(
                fontSize: 20,
              )),
          centerTitle: true,
        ),
        body: Container(
          color: Color(0xFF487890),
          height: double.infinity,
          child: body(context),
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return EnhancedFutureBuilder(
        future: ApiController.sendRequestForPortalEvents(),
        whenNotDone: Center(
          child:
              Image.asset('assets/images/member_app_assets/Curve-Loading.gif'),
        ),
        rememberFutureResult: false,
        whenDone: (dynamic data) {
          List<PortalEvents> _eventList = data;
          return Container(
            margin: EdgeInsets.only(left: 5.0, right: 5.0),
            child: _eventList == null
                ? _noContentWidget(context)
                : _eventList.length <= 0
                    ? _noContentWidget(context)
                    : RefreshIndicator(
                        child: ListView.builder(
                          itemCount: _eventList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildListViewItemWidget(
                                context, _eventList[index]);
                          },
                        ),
                        onRefresh: () async {
                          setState(() {});
                        },
                      ),
          );
        });
  }

  Widget _buildListViewItemWidget(BuildContext context, PortalEvents event) {
    return Card(
      elevation: 1.0,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _rowItem(
                isTitle: true,
                map: {'Title1': 'Title', 'Value1': event.EventsTitle}),
            SizedBox(
              height: 5.0,
            ),
            _rowItem(hasColumn: true, hasBothColumns: true, map: {
              'Title1': 'Start Date',
              'Title2': 'End Date',
              'Value1': event.StartDate,
              'Value2': event.EndDate
            }),
            SizedBox(
              height: 5.0,
            ),
            _rowItem(hasColumn: true, hasBothColumns: true, map: {
              'Title1': 'Start Time',
              'Title2': 'End Time',
              'Value1': event.StartTime,
              'Value2': event.EndTime
            }),
            SizedBox(
              height: 5.0,
            ),
            _rowItem(
                hasColumn: true,
                hasBothColumns: false,
                map: {'Title1': 'Venue', 'Value1': event.Venue}),
            SizedBox(
              height: 5.0,
            ),
            _rowItem(
                hasColumn: true,
                hasBothColumns: false,
                map: {'Title1': 'Description', 'Value1': event.Description}),
            SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowItem(
      {bool hasColumn = false,
      bool hasBothColumns = false,
      Map map,
      bool isTitle = false}) {
    TextStyle headerStyle = new TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.blue,
    );

    TextStyle valueStyle = new TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black);

    if (hasColumn) {
      if (hasBothColumns)
        return (Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  map['Title1'],
                  style: headerStyle,
                ),
                Text(
                  map['Value1'],
                  softWrap: true,
                  style: valueStyle,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  map['Title2'],
                  style: headerStyle,
                ),
                Text(
                  map['Value2'],
                  softWrap: true,
                  style: valueStyle,
                )
              ],
            ),
          ],
        ));
      else
        return (Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //wrap_content
            Flexible(
              child: Column(
                children: <Widget>[
                  map['Title1'] == 'Description'
                      ? Center(
                          child: Text(
                            map['Title1'],
                            style: headerStyle,
                          ),
                        )
                      : Text(
                          map['Title1'],
                          style: headerStyle,
                        ),
                  Padding(
                    padding: map['Title1'] == 'Description'
                        ? EdgeInsets.only(left: 5.0, right: 5.0)
                        : EdgeInsets.only(left: 0.0, right: 0.0),
                    child: Text(
                      map['Value1'],
                      softWrap: true,
                      style: valueStyle,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
    } else if (isTitle) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(map['Title1'],
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: Text(map['Value1'],
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            )
          ],
        ),
      );
    }
  }

  Widget _noContentWidget(BuildContext context) => Center(
        child: Text(
          'No school events details to show',
          style: TextStyle(
              color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      );
}
