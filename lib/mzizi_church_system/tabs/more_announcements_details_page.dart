import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_detailed_todo_list_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_widgets.dart';

class PortalMoreAnnouncementsDetails extends KFDrawerContent {
  final VoidCallback onMenuPressedHere;

  PortalMoreAnnouncementsDetails({this.onMenuPressedHere});

  @override
  _PortalMoreAnnouncementsDetailsState createState() =>
      _PortalMoreAnnouncementsDetailsState();
}

class _PortalMoreAnnouncementsDetailsState
    extends State<PortalMoreAnnouncementsDetails> {
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
          title: Text('Announcements, Sermons',
              style: TextStyle(
                fontSize: 20,
              )),
          centerTitle: true,
        ),
        body: Container(
            height: double.infinity, color: Color(0xFF487890), child: body()),
      ),
    );
  }

  Widget body() {
    return Container(
        margin: EdgeInsets.all(5),
        child: EnhancedFutureBuilder(
            future: ApiController.sendRequestForPortalDetailedToDoList(),
            rememberFutureResult: false,
            whenDone: (dynamic data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return listItemWidget(data[index]);
                },
              );
            },
            whenNotDone: Center(
              child: Image.asset(
                  'assets/images/member_app_assets/Curve-Loading.gif'),
            )));
  }

  Widget listItemWidget(PortalDetailedTodoList response) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  ': ' + response.Name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                Container(height: 1, color: Colors.black),
                SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          response.Body,
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new RichText(
                              text: new LinkTextSpan(
                                  url: 'https://mzizi.co.ke',
                                  text: 'Open Attachment',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15.0)),
                            ),
                          ],
                        ),
                      ],
                    )),
              ]),
        ),
      ),
    );
  }
}
