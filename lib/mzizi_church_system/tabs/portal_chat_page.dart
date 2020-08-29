import 'dart:async';

import 'package:bubble/bubble.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/portal_contacts_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/portal_parent_chat_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/database/database_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_parent_chat_message_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/portal_parent_chat_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_contacts_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_parent_chat_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/enhanced_stream_builder.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_widgets.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';

ParentChatResponseDBDao daopass;

class WhenNotDone extends StatefulWidget {
  VoidCallback onMenuPressedHere;
  ParentChatResponseDBDao dao;

  WhenNotDone(this.dao);

  @override
  _WhenNotDoneState createState() => _WhenNotDoneState();
}

class _WhenNotDoneState extends State<WhenNotDone> {
  @override
  Widget build(BuildContext context) {
    if (widget.dao == null)
      return Container(
          height: 250,
          width: 250,
          padding: EdgeInsets.all(0),
          child:
              Image.asset('assets/images/member_app_assets/Curve-Loading.gif'));
    else
      return Container(
          child: EnhancedStreamBuilder(
        stream: widget.dao.getParentChatResponseStream(),
        rememberStreamResult: false,
        whenNotDone: Center(
          child: Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.all(0),
              child: Image.asset(
                  'assets/images/member_app_assets/Curve-Loading.gif')),
        ),
        whenDone: (dynamic data) {
          return _chats(data, context, () async {
            setState(
              () {},
            );
          }, this);
        },
      ));
  }
}

Future<List<ParentChatResponse>> _optionToFetchFromApi(
    {String message = "",
    String enquiryType = "1",
    bool sending = false,
    bool resend = false}) async {
  final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();

  daopass = db.getParentChatResponseDBDao;

  final PortalParentChatDAO dao = new PortalParentChatDAO();
  //This is for testing, dont undo
  // await dao.deleteParentChatResponse();

  if (message.isEmpty && sending) {
    Fluttertoast.showToast(
        msg: "Please specify message to send.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red[900],
        textColor: Colors.white,
        fontSize: 16.0);
    return await dao.getParentChatResponse();
  }

  try {
    if (await UtilityFunctions.checkConnection()) {
      if (resend) {
        await dao.deleteOneParentChatResponse(message);
      }

      if (message.isNotEmpty) {
        List<ParentChatResponse> chatList = new List();
        ParentChatResponse chat = new ParentChatResponse(
            null, message, "now", "You", false, false, true);
        chatList.add(chat);

        await dao.insertPortalParentChat(chatList);
      }
      Student student = await AuthenticateUserDAO().getStudent();
      //Student student = new Student("23309", "1000");

      if (student != null) {
        PortalParentChatRequest request = new PortalParentChatRequest(
          student.StudentID,
          message,
          "0",
          student.AppCode,
          // enquiryType
        ); //1= General Enquiry

        //TODO: Check messages that are new
        //  for(int i = 0; i < (portalChats as List<ParentChatResponse>).length; i++){
        //    if()
        //  }

        //Two since one was not doing all the work
        List<ParentChatResponse> portalChatsList =
            await ApiController.sendRequestForPortalParentChats(request);

        portalChatsList =
            await ApiController.sendRequestForPortalParentChats(request);

        for (int i = 0; i < portalChatsList.length; i++) {
          portalChatsList[i].sent = true;
          portalChatsList[i].notSent = false;
          portalChatsList[i].sending = false;
        }

        //Failed assertion: boolean expression must not be null"
        //check this
        if (portalChatsList.length > 0) await dao.deleteParentChatResponse();

        await dao.insertPortalParentChat(portalChatsList);

        List<ParentChatResponse> getList = await dao.getParentChatResponse();

        return portalChatsList;
      } else {
        return dao.getParentChatResponse();
      }
    } else {
      //use resend frag to prevent from two messages appearing for resend
      if (sending && message.isNotEmpty && !resend) {
        List<ParentChatResponse> chatList = new List();
        ParentChatResponse chat = new ParentChatResponse(
            null, message, "now", "You", false, true, false);
        chatList.add(chat);
        await dao.insertPortalParentChat(chatList);
        Fluttertoast.showToast(
            msg: "Ooops, check your internet connection",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.red[900],
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return dao.getParentChatResponse();
    }
  } catch (e) {
    return dao.getParentChatResponse();
  }
}

class PortalChatPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;

  PortalChatPage({this.onMenuPressedHere});

  @override
  _PortalChatPageState createState() => _PortalChatPageState();
}

class _PortalChatPageState extends State<PortalChatPage> {
  final textFormEditorController = new TextEditingController();
  ParentChatResponseDBDao dao;
  @override
  void initState() {
    // _optionToFetchFromApi();
    // _controller.animateTo(20 * 20-1.0,
    //                                           duration: Duration(seconds: 2),
    //                                           curve: Curves.fastOutSlowIn);
    super.initState();
  }

//https://stackoverflow.com/questions/41479255/life-cycle-in-flutter
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    textFormEditorController.dispose();
    super.dispose();
  }

  Future<bool> _onBackPressed() {
    RouteController.routeMethod(0,
        controller: Controller.Navigator, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: _onBackPressed,
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
            title: Text('Chat',
                style: TextStyle(
                  fontSize: 20,
                )),
            centerTitle: true,
            // actions: <Widget>[
            //   SpringButton(
            //     SpringButtonType.OnlyScale,
            //     Container(
            //       child: Icon(LineIcons.paper_plane),
            //     ),
            //     onTapDown: (_) {},
            //   ),
            //   SizedBox(width: 10),
            //   Container(
            //       child: FaIcon(FontAwesomeIcons.donate, size: 20, color: Colors.red,),
            //     ),
            //   SpringButton(
            //     SpringButtonType.OnlyScale,
            //     Container(
            //       child: Icon(Icons.refresh),
            //     ),
            //     onTapDown: (_) {},
            //   ),
            // ],
          ),
          body: Container(
            color: Color(0xFF487890),
            child: Stack(
              children: <Widget>[
                //Testing
                // Positioned(
                //     child: Container(
                //         child: StreamBuilder<List<ParentChatResponse>>(
                //   stream: widget.dao.getParentChatResponseStream(),
                //   builder: (_, snapshot) {
                //     Widget returnWidget = Container();

                //     if (snapshot.connectionState == ConnectionState.waiting)
                //       returnWidget = Center(
                //         child: CircularProgressIndicator(),
                //       );

                //     if (snapshot.connectionState == ConnectionState.active) {
                //       final chatResponse = snapshot.data;
                //       returnWidget = SafeArea(
                //           child: Scaffold(
                //               body: Container(
                //                   child: Text(chatResponse.length.toString()))));
                //     }
                //     return returnWidget;
                //   },
                // ))),
                // Positioned(
                //   top: 5.0,
                //   right: 5.0,
                //   left: 5.0,
                //   child: Container(
                //     width: MediaQuery.of(context).size.width / 2,
                //     height: 40.0,
                //     child: Center(
                //       child: Image.asset("assets/images/key_bg_icon.png"),
                //     ),
                //   ),
                // ),
                Container(
                    margin: EdgeInsets.only(
                        bottom: 45.0, top: 10.0, left: 5.0, right: 5.0),
                    color: Color(0xFF487890),
                    child:
                        //EnhancedStreamBuilder(
                        EnhancedFutureBuilder(
                      future: _optionToFetchFromApi(),
                      //future: ChatsDummyData().chatsDummeData(),
                      //stream: _chatDao.getParentChatResponseStream(),
                      //stream: _data,
                      //stream: widget.dao.getParentChatResponseStream(),
                      whenNotDone: Center(
                        child:
                            WhenNotDone(daopass), //CircularProgressIndicator(),
                      ),
                      //rememberStreamResult: false,
                      rememberFutureResult: false,
                      whenDone: (dynamic data) {
                        return _chats(data, context, () async {
                          setState(() {});
                        }, this);
                      },
                    )),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Center(
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.all(0.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 1.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 40.0,
                              margin: EdgeInsets.all(0.0),
                              child: TextField(
                                onTap: () {
                                  Timer(
                                      Duration(milliseconds: 1000),
                                      () => _controller.animateTo(
                                            _controller
                                                .position.maxScrollExtent,
                                            curve: Curves.fastOutSlowIn,
                                            duration: const Duration(
                                                milliseconds: 1000),
                                          ));
                                },
                                onChanged: (value) {
                                  Timer(
                                      Duration(milliseconds: 1000),
                                      () => _controller.animateTo(
                                            _controller
                                                .position.maxScrollExtent,
                                            curve: Curves.fastOutSlowIn,
                                            duration: const Duration(
                                                milliseconds: 1000),
                                          ));
                                },
                                keyboardType: TextInputType.multiline,
                                textAlign: TextAlign.start,
                                maxLines: null,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                                controller: textFormEditorController,
                                decoration: InputDecoration(
                                  //https://stackoverflow.com/questions/50400529/how-to-update-flutter-textfields-height-and-width
                                  contentPadding: const EdgeInsets.only(
                                      bottom: 7.0, left: 5.0),
                                  border: InputBorder.none,
                                  fillColor: Colors.amber,
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14.0),
                                  hintText: "Enter message",
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                Timer(
                                    Duration(milliseconds: 1000),
                                    () => _controller.animateTo(
                                          _controller.position.maxScrollExtent,
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          duration: const Duration(
                                              milliseconds: 1000),
                                        ));

                                _optionToFetchFromApi(
                                    enquiryType: enquityTypeID,
                                    message: textFormEditorController.text,
                                    sending: true);
                                textFormEditorController.clear();
                              });
                            },
                            child: Container(
                              width: 70.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                              ),
                              child: Center(
                                  child: Text(
                                "Send",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                          // SizedBox(
                          //   height: 40.0,
                          //   width: 1.0,
                          // ),
                          // PopupDropDown()
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String enquityTypeID;

class PopupDropDown extends StatefulWidget {
  @override
  _PopupDropDownState createState() => _PopupDropDownState();
}

class _PopupDropDownState extends State<PopupDropDown> {
  bool _clicked = false;

  //This will not display _showPopupMenu at the location where you presed on the button
  //https://stackoverflow.com/questions/50758121/how-dynamically-create-and-show-a-popup-menu-in-flutter
//   void _showPopupMenu() async {
//   await showMenu(
//     context: context,
//     position: RelativeRect.fromLTRB(100, 100, 100, 100),
//     items: [
//       PopupMenuItem(
//         child: Text("View"),
//       ),
//       PopupMenuItem(
//         child: Text("Edit"),
//       ),
//       PopupMenuItem(
//         child: Text("Delete"),
//       ),
//     ],
//     elevation: 8.0,
//   );
// }

  final List<String> popupRoutes = <String>[
    'Select enquiry to',
    'General Enquiry',
    'Admissions',
    'Academics',
    'Finance',
    'Transport',
    'Sports',
    'Library'
  ];

  @override
  void initState() {
    super.initState();

    enquityTypeID = _getPopupRoutesID(popupRoutes[1]);
  }

  String _getPopupRoutesID(String enquiryType) {
    for (int item = 0; item < popupRoutes.length; item++) {
      if (enquiryType == popupRoutes[item]) {
        enquityTypeID = item.toString();
      }
    }

    return enquityTypeID;
  }

//For this use gesture detector
  _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;

//https://github.com/flutter/flutter/issues/12931
    String selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(left, 400, 0, 0),
      items: popupRoutes.map((String popupRoute) {
        return new PopupMenuItem<String>(
          child: new Text(popupRoute),
          value: popupRoute,
        );
      }).toList(),
      elevation: 5.0,
    );

    if (selected != null && selected != "Select enquiry to") {
      setState(() {
        enquityTypeID = _getPopupRoutesID(selected);
      });
    } else {
      enquityTypeID = _getPopupRoutesID(popupRoutes[1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        //if(!_clicked)
        _showPopupMenu(details.globalPosition); //.then((int item) {
        //   //  print(item);
        //   // Fluttertoast.showToast(
        //   //     msg: "Item Clicked: " + item.toString(),
        //   //     toastLength: Toast.LENGTH_SHORT,
        //   //     gravity: ToastGravity.CENTER,
        //   //     timeInSecForIos: 1,
        //   //     backgroundColor: Colors.red,
        //   //     textColor: Colors.white,
        //   //     fontSize: 16.0);
        // });
        this.setState(() {
          _clicked = !_clicked;
        });
      },
      child: Container(
        height: 40.0,
        width: 30.0,
        decoration: BoxDecoration(color: Colors.amber),
        child: Center(
            child: Icon(
          _clicked ? Icons.arrow_drop_up : Icons.arrow_drop_down,
          size: 34.0,
          color: Colors.white,
        )),
      ),
    );
  }
}

Widget messageSent(
    PortalChatMessage message, bool _readOrNotRead, bool showNip, state) {
  Widget bubbleWidget = Container(
    width: double.infinity,
    margin: EdgeInsets.only(left: 30.0, top: message.showCanceled ? 15.0 : 0.0),
    child: Container(
      child: Bubble(
          margin: BubbleEdges.only(top: 10),
          nip: showNip ? BubbleNip.rightTop : BubbleNip.no,
          color: Colors.amber,
          child: Stack(
            children: <Widget>[
              Container(
                //TODO: Should check if double.infinity is a good practise
                //width: double.infinity,
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  message.message,
                  // CustomStrings
                  //     .exampleText /*,overflow: TextOverflow.visible,textAlign: TextAlign.left*/,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontStyle: FontStyle.normal),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 5.0,
                child: Container(
                    child: Row(
                  children: <Widget>[
                    _dateWidget(message.createdAt, _readOrNotRead),
                    _sending_NotSent_Sent_Widget(message.showLoading,
                        message.showCanceled, message.showSuccess),
                  ],
                )),
              )
            ],
          )),
    ),
  );

  return Container(
    margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            color: Color(0xFF487890),
            padding: EdgeInsets.all(2.0),
            child: Stack(
              children: <Widget>[
                _tapToSendWidget(
                  message.showCanceled,
                ),
                //This is the image
                //showNip ? _receivedFromIconWidget() : Container(),
                InkWell(
                    onTap: () async {
                      state.setState(() {
                        Timer(
                            Duration(milliseconds: 1000),
                            () => _controller.animateTo(
                                  _controller.position.maxScrollExtent,
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: const Duration(milliseconds: 1000),
                                ));

                        _optionToFetchFromApi(
                            enquiryType: enquityTypeID,
                            message: message.message,
                            sending: true,
                            resend: true);
                      });
                    },
                    child: bubbleWidget)
              ],
            ))
      ],
    ),
  );
}

Widget replySent(PortalChatMessage message, bool _readOrNotRead, bool showNip) {
  return Container(
    margin: EdgeInsets.only(left: 30.0, top: 0.0),
    child: Bubble(
        margin: BubbleEdges.only(top: 10),
        nip: showNip ? BubbleNip.leftTop : BubbleNip.no,
        color: const Color(0xFF376DCB), //CustomColors.textPrimary,
        child: Stack(
          children: <Widget>[
            Container(
              //TODO: Should check if double.infinity is a good practise
              //width: double.infinity,
              margin: EdgeInsets.only(bottom: 20.0),
              child: Text(
                message.message,
                // CustomStrings
                //     .exampleText /*,overflow: TextOverflow.visible,textAlign: TextAlign.left*/,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontStyle: FontStyle.normal),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 5.0,
              child: Container(
                  child: Row(
                children: <Widget>[
                  _dateWidget(message.createdAt, _readOrNotRead),
                  _readOrNotReadWidget(_readOrNotRead)
                ],
              )),
            )
          ],
        )),
  );
}

Widget replySentWithIcon(
    PortalChatMessage message, bool _readOrNotRead, bool showNip) {
  Widget bubbleWidget = Container(
    margin: EdgeInsets.only(left: 38.0, top: showNip ? 15.0 : 0.0),
    child: Bubble(
        margin: BubbleEdges.only(top: 10),
        nip: showNip ? BubbleNip.leftTop : BubbleNip.no,
        color: const Color(0xFF9966ff), //CustomColors.textPrimary,
        child: Stack(
          children: <Widget>[
            Container(
              //TODO: Should check if double.infinity is a good practise
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20.0),
              child: Text(
                message.message,
                // CustomStrings
                //     .exampleText /*,overflow: TextOverflow.visible,textAlign: TextAlign.left*/,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontStyle: FontStyle.normal),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 5.0,
              child: Container(
                  child: Row(
                children: <Widget>[
                  _dateWidget(message.createdAt, _readOrNotRead),
                  _readOrNotReadWidget(_readOrNotRead)
                ],
              )),
            )
          ],
        )),
  );

  return Container(
    margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            color: Color(0xFF487890),
            padding: EdgeInsets.all(2.0),
            child: Stack(
              children: <Widget>[
                //_tapToViewWidget(_tapOrNot, () {}),
                showNip ? _receivedFromIconWidget() : Container(),
                bubbleWidget
              ],
            ))
      ],
    ),
  );
}

Widget _tapToSendWidget(bool tapOrNot) {
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
        child: Container(
          child: Text("Tap to Send",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              )),
        ),
      ),
    ),
  );
}

Widget _receivedFromIconWidget() {
  //return Icon(FontAwesomeIcons.facebookMessenger);
  return Image(
    image: AssetImage('assets/images/member_app_assets/mzizi_church_logo.png'),
    height: 40.0,
    width: 40.0,
  );
}

Widget _dateWidget(String dateSent, bool readOrNotRead) {
  return Text(
    dateSent,
    style: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 12.0, color: Colors.white),
  );
}

Widget _sending_NotSent_Sent_Widget(bool sending, bool notSent, bool sent) {
  Widget returnWidget = Container();

  if (sending) {
    returnWidget = Container(
      height: 10.0,
      width: 10.0,
      margin: EdgeInsets.only(bottom: 0.0, left: 5.0),
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2.0,
      ),
    );
  }

  if (notSent) {
    returnWidget = Container(
      margin: EdgeInsets.only(bottom: 0.0, left: 5.0),
      child: Icon(Icons.close, color: Colors.white, size: 15.0),
    );
  }

  if (sent) {
    returnWidget = Container(
      margin: EdgeInsets.only(bottom: 0.0, left: 5.0),
      child: Icon(Icons.done_all, color: Colors.white, size: 15),
    );
  }

  return returnWidget;
}

Widget _readOrNotReadWidget(bool _readOrNotRead) {
  return Container();
  // return _readOrNotRead
  //     ? Container(
  //         margin: EdgeInsets.only(left: 5.0),
  //         decoration:
  //             BoxDecoration(shape: BoxShape.circle, color: Color(0xFF669900)),
  //         width: 10.0,
  //         height: 10.0,
  //       )
  //     : Container(
  //         margin: EdgeInsets.only(left: 5.0),
  //         decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
  //         width: 10.0,
  //         height: 10.0,
  //       );
}

Widget _noContentWidget(BuildContext context) => Center(
      child: Text(
        'Start a new chat...',
        style: TextStyle(
            color: Colors.amber, fontSize: 13.0, fontWeight: FontWeight.normal),
      ),
    );

final _controller = ScrollController();

Widget _chats(
    dynamic data, BuildContext context, VoidCallback onRefresh, state) {
  List<PortalChatMessage> _chatMessageList = new List();

  for (ParentChatResponse chatResponse in data) {
    PortalChatUser user = new PortalChatUser(isSender: false);
    if (chatResponse.Actor.contains("You")) {
      user = new PortalChatUser(isSender: true);
    }

    PortalChatMessage message = new PortalChatMessage(
        chatResponse.Msg,
        user,
        chatResponse.DatePosted,
        chatResponse.sending,
        chatResponse.notSent,
        chatResponse.sent);
    _chatMessageList.add(message);
  }

  Timer(
      Duration(milliseconds: 1000),
      () => _controller.animateTo(
            _controller.position.maxScrollExtent,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 1000),
          ));

  return _chatMessageList == null
      ? _noContentWidget(context)
      : _chatMessageList.length <= 0
          ? _noContentWidget(context)
          : RefreshIndicator(
              onRefresh: onRefresh,
              child: Scrollbar(
                child: ListView.builder(
                  reverse: false,
                  //physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  itemCount: _chatMessageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (_chatMessageList[index].sender.isSender) {
                      bool showNip = false;
                      if (index == 0)
                        showNip = true;
                      else if (_chatMessageList[index - 1].sender.isSender ==
                          _chatMessageList[index].sender.isSender)
                        showNip = false;
                      else
                        showNip = true;
                      return messageSent(
                          _chatMessageList[index], false, showNip, state);
                    } else {
                      bool showNip = false;
                      if (index == 0)
                        showNip = true;
                      else if (_chatMessageList[index - 1].sender.isSender ==
                          _chatMessageList[index].sender.isSender)
                        showNip = false;
                      else
                        showNip = true;
                      return replySentWithIcon(
                          _chatMessageList[index], false, showNip);
                    }
                  },
                ),
              ),
            );
}
