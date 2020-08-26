import 'dart:async';

import 'package:bubble/bubble.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/portal_notification_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_notification_message.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/portal_notification_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_notification_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';

class PortalNotificationPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  PortalNotificationPage({this.onMenuPressedHere});
  @override
  _PortalNotificationPageState createState() => _PortalNotificationPageState();
}

class _PortalNotificationPageState extends State<PortalNotificationPage> {
  bool _readOrNotRead = true;
  String _notificaitonText;
  String _notificationDate;
  bool _tapOrNot = true;

  Future<dynamic> _optionToFetchOnline() async {
    try {
      if (await UtilityFunctions.checkConnection()) {
        await new PortalNotificationDAO().deletePortalNotification(
            await new PortalNotificationDAO().getPortalNotification());
        // Student student = await AuthenticateUserDAO().getStudent();
        Student student = new Student("1391", "1000");
        if (student != null) {
          List<PortalNotification> notificationList =
              await new PortalNotificationDAO().getLastNotification();

          List<PortalNotificationMessage> notificationMessageList = new List();
          if (notificationList.isNotEmpty) {
            for (PortalNotification notification in notificationList) {
              PortalNotificationRequest notificationRequest =
                  new PortalNotificationRequest(student.StudentID,
                      student.AppCode, notification.MsgID as String);

              //TODO: Solve this error raising from here, for NO CONTENT
              //Raising errrors, no content

              final List<PortalNotification> notifications =
                  await ApiController.sendRequestForPortalNotifications(
                      notificationRequest);

              //TODO: Format for old messages, those older than 30 days

              //notification that have already been read, thats after being fetched,
              //this is different from how android does it.
              // List<AppNotificationCount> appNotificationCountList =
              //     await new AppNotificationCountDAO()
              //         .getAppNotificationCountDAO();

              for (PortalNotification notif in notifications) {
                {
                  PortalNotificationMessage notificationMessage =
                      new PortalNotificationMessage(
                          notif.MsgID, notif.Msg, notif.DateSent, false,
                          msgIsChat: false,
                          msgIsTransaction: false,
                          msgIsEvents: false,
                          msgIsResults: false);

                  if (notificationMessage.Msg.contains("Results") ||
                      notificationMessage.Msg.contains("term") ||
                      notificationMessage.Msg.contains('results')) {
                    notificationMessage.msgIsResults = true;
                  } else if (notificationMessage.Msg.contains("receipt") ||
                      notificationMessage.Msg.contains("transaction") ||
                      notificationMessage.Msg.contains("Receipt") ||
                      notificationMessage.Msg.contains("Transaction")) {
                    notificationMessage.msgIsTransaction = true;
                  } else if (notificationMessage.Msg.contains("event") ||
                      notificationMessage.Msg.contains("Event")) {
                    notificationMessage.msgIsEvents = true;
                  }
                  if (notificationMessage.Msg.contains("chat") ||
                      notificationMessage.Msg.contains("Chat")) {
                    notificationMessage.msgIsChat = true;
                  }

                  notificationMessageList.add(notificationMessage);
                }
              }

              //add the new notification for new notifications
              //TODO: Sending read notification should be sent later when the workmanager is working
              // List<AppNotificationCount> appnotifCountList = new List();
              // for (PortalNotification notification in notifications) {
              //   AppNotificationCount notificationCount =
              //       new AppNotificationCount(notification.MsgID);
              //   appnotifCountList.add(notificationCount);
              // }
              // //will be used to show the read and  not read, messages
              // await new AppNotificationCountDAO()
              //     .insertAppNotificationCountDAO(appnotifCountList);

//for testing
              // await new PortalNotificationDAO()
              //     .insertPortalNotification(notifications);

              return notificationMessageList;
            }
          } else {
            PortalNotificationRequest notificationRequest =
                new PortalNotificationRequest(
                    student.StudentID, student.AppCode, '0');
            final dynamic notifications =
                await ApiController.sendRequestForPortalNotifications(
                    notificationRequest);

            for (PortalNotification notif in notifications) {
              {
                PortalNotificationMessage notificationMessage =
                    new PortalNotificationMessage(
                        notif.MsgID, notif.Msg, notif.DateSent, false,
                        msgIsChat: false,
                        msgIsTransaction: false,
                        msgIsEvents: false,
                        msgIsResults: false);

                if (notificationMessage.Msg.contains("Results") ||
                    notificationMessage.Msg.contains("term") ||
                    notificationMessage.Msg.contains('results')) {
                  notificationMessage.msgIsResults = true;
                } else if (notificationMessage.Msg.contains("receipt") ||
                    notificationMessage.Msg.contains("transaction") ||
                    notificationMessage.Msg.contains("Receipt") ||
                    notificationMessage.Msg.contains("Transaction")) {
                  notificationMessage.msgIsTransaction = true;
                } else if (notificationMessage.Msg.contains("event") ||
                    notificationMessage.Msg.contains("Event")) {
                  notificationMessage.msgIsEvents = true;
                }
                if (notificationMessage.Msg.contains("chat") ||
                    notificationMessage.Msg.contains("Chat")) {
                  notificationMessage.msgIsChat = true;
                }

                notificationMessageList.add(notificationMessage);
              }
            }
//have to rethink this
            return notificationMessageList;
          }

          return notificationMessageList;
        } else {
          return showNewNotifications(
              await new PortalNotificationDAO().getPortalNotification());
        }
      } else {
        return showNewNotifications(
            await new PortalNotificationDAO().getPortalNotification());
      }
    } catch (e) {
      return showNewNotifications(
          await new PortalNotificationDAO().getPortalNotification());
    }
  }

  Future<List<PortalNotificationMessage>> showNewNotifications(
    List<PortalNotification> notificationList,
  ) async {
    List<PortalNotificationMessage> notificationMessageList = new List();

    for (PortalNotification notif in notificationList) {
      PortalNotificationMessage notificationMessage =
          new PortalNotificationMessage(
              notif.MsgID, notif.Msg, notif.DateSent, true,
              msgIsChat: false,
              msgIsTransaction: false,
              msgIsEvents: false,
              msgIsResults: false);

      if (notificationMessage.Msg.contains("Results") ||
          notificationMessage.Msg.contains("term") ||
          notificationMessage.Msg.contains('results')) {
        notificationMessage.msgIsResults = true;
      } else if (notificationMessage.Msg.contains("receipt") ||
          notificationMessage.Msg.contains("transaction") ||
          notificationMessage.Msg.contains("Receipt") ||
          notificationMessage.Msg.contains("Transaction")) {
        notificationMessage.msgIsTransaction = true;
      } else if (notificationMessage.Msg.contains("event") ||
          notificationMessage.Msg.contains("Event")) {
        notificationMessage.msgIsEvents = true;
      }
      if (notificationMessage.Msg.contains("chat") ||
          notificationMessage.Msg.contains("Chat")) {
        notificationMessage.msgIsChat = true;
      }

      notificationMessageList.add(notificationMessage);
    }

    return notificationMessageList;
  }

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF487890),
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
          title: Text('SMS History',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
        ),
        body: Container(
          color: Color(0xFF487890),
          child: Stack(
            children: <Widget>[
              //TODO: Will change the view of this
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: KeySection(),
              // ),
              Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: EnhancedFutureBuilder(
                  //future: _optionToFetchOnline(),
                  future: ApiController.sendRequestForPortalSMSHistory(),
                  whenNotDone: Center(
                    child: Image.asset(
                        'assets/images/member_app_assets/Curve-Loading.gif'),
                  ),
                  //Set rememberFutureResults to false to make the RefreshIndicator work
                  rememberFutureResult: false,
                  whenDone: (dynamic data) {
                    List<PortalNotificationMessage> _notificationList = data;

                    Timer(
                        Duration(milliseconds: 1000),
                        () => _controller.animateTo(
                              _controller.position.maxScrollExtent,
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 1000),
                            ));

                    return Container(
                      color: Color(0xFF487890),
                      child: Stack(
                        children: <Widget>[
                          _notificationList == null
                              ? _noContentWidget(context)
                              : _notificationList.length <= 0
                                  ? _noContentWidget(context)
                                  : RefreshIndicator(
                                      child: ListView.builder(
                                        controller: _controller,
                                        itemCount: _notificationList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return _buildListViewItemWidget(
                                            _notificationList[index],
                                          );
                                        },
                                      ),
                                      onRefresh: () async {
                                        //Just calling this is enough
                                        setState(() {});
                                      },
                                    ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildListViewItemWidget(
  PortalNotificationMessage notification,
) {
  bool _tapOrNot = notification.msgIsChat ||
          notification.msgIsEvents ||
          notification.msgIsResults ||
          notification.msgIsTransaction
      ? true
      : false;
  bool _readOrNotRead = notification.isRead;

  return Container(
    margin: EdgeInsets.only(top: 0.0, bottom: 5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(2.0),
            child: Stack(
              children: <Widget>[
                _tapToViewWidget(_tapOrNot, () {}),
                _receivedFromIconWidget(),
                _bubbleWidget(notification, _readOrNotRead)
              ],
            ))
      ],
    ),
  );
}

Widget _tapToViewWidget(bool tapOrNot, VoidCallback onTap) {
  return Align(
    alignment: Alignment.topRight,
    child: Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(top: 5.0, right: 5.0),
      child: Visibility(
        maintainSize: true,
        maintainState: true,
        maintainAnimation: true,
        visible: tapOrNot,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            "Tap to view",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF487890)),
          ),
        ),
      ),
    ),
  );
}

Widget _receivedFromIconWidget() {
  return Container();
  // return Image(
  //   image: AssetImage(CustomDrawables.notificationReceivedFrom),
  //   height: 40.0,
  //   width: 40.0,
  // );
}

Widget _bubbleWidget(
    PortalNotificationMessage notification, bool _readOrNotRead) {
  return Container(
    margin: EdgeInsets.only(left: 5.0, top: 5.0),
    child: Bubble(
        margin: BubbleEdges.only(top: 10),
        nip: BubbleNip.leftTop,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              //TODO: Should check if double.infinity is a good practise
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20.0),
              child: Text(
                notification.Msg,
                // CustomStrings
                //     .exampleText /*,overflow: TextOverflow.visible,textAlign: TextAlign.left*/,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF487890),
                    fontStyle: FontStyle.normal),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 5.0,
              child: Container(
                  child: Row(
                children: <Widget>[
                  _dateWidget(notification.DateSent, _readOrNotRead),
                  _readOrNotReadWidget(_readOrNotRead)
                ],
              )),
            )
          ],
        )),
  );
}

Widget _dateWidget(String dateSent, bool readOrNotRead) {
  return Text(
    UtilityFunctions.formatDate(dateSent),
    style: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
      color: Color(0xFF487890),
    ),
  );
}

Widget _readOrNotReadWidget(bool _readOrNotRead) {
  return _readOrNotRead
      ? Container(
          margin: EdgeInsets.only(left: 5.0),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFF669900)),
          width: 10.0,
          height: 10.0,
        )
      : Container(
          margin: EdgeInsets.only(left: 5.0),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          width: 10.0,
          height: 10.0,
        );
}

Widget _noContentWidget(BuildContext context) => Center(
      child: Text(
        'No sms history to show',
        style: TextStyle(
            color: Colors.green, fontSize: 13.0, fontWeight: FontWeight.normal),
      ),
    );
