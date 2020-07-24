import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SettingsPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  SettingsPage({this.onMenuPressedHere});
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: listOfVideoWidget()),
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 30, left: 5.0, right: 5.0, bottom: 10),
                      color: Colors.black38,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
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
                          Container(
                            child: RichText(
                              text: TextSpan(
                                text: 'SERMONS',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'MontserratBold',
                                    color: Colors.white,
                                    fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '  /  ',
                                  ),
                                  TextSpan(
                                      text: 'SERIES',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[400],
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: SpringButton(
                              SpringButtonType.OnlyScale,
                              // row(
                              //   "Increment",
                              //   Colors.deepPurpleAccent,
                              // ),
                              Container(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                              onTapDown: (_) {},
                              //(_) => incrementCounter(),
                              // onLongPress: () => timer = Timer.periodic(
                              //   const Duration(milliseconds: 100),
                              //   (_) => incrementCounter(),
                              // ),
                              // onLongPressEnd: (_) {
                              //   timer?.cancel();
                              // },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }

  List<Widget> listOfVideoWidget() {
    List<Widget> returnList = new List();

    final List<String> _videosList = [
      'https://imagizer.imageshack.com/img922/1959/IaIQx8.jpg',
      'https://imagizer.imageshack.com/img924/7272/YYCa8d.jpg',
      'https://imagizer.imageshack.com/img924/3559/QWs8fu.jpg',
      'https://imagizer.imageshack.com/img923/268/u1cHRX.jpg',
    ];
    //Blur image
    //https://medium.com/fluttervn/how-to-make-blur-effect-in-flutter-using-backdropfilter-imagefilter-559ffd8ab73

    List<VideoDetails> videoListDetails = new List();
    VideoDetails videoDetails1 = new VideoDetails('A Life Free of Sin',
        ['LAST SUNDAY', 'by', 'PASTOR RANDY'], true, true);
    videoListDetails.add(videoDetails1);
    VideoDetails videoDetails2 = new VideoDetails(
        'Getting it right by doing it wrong',
        ['JAN 31', 'by', 'STEVE BROWN'],
        true,
        false);
    videoListDetails.add(videoDetails2);
    VideoDetails videoDetails3 = new VideoDetails(
        'Introducing HANDMADE', ['JAN 31', 'by', 'STEVE BROWN'], true, true);
    videoListDetails.add(videoDetails3);
    VideoDetails videoDetails4 = new VideoDetails(
        'Gospel Vision & Gospel Deatch',
        ['FEB 7', 'by', 'JEFF NORRIS'],
        false,
        true);
    videoListDetails.add(videoDetails4);

    for (int index = 0; index < _videosList.length; index++) {
      returnList.add(Container(
        height: 300,
        child: Stack(children: <Widget>[
          Image.network(
            _videosList[index],
            fit: BoxFit.fill,
            height: 300,
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.black54,
          ),
          Container(
            height: 300,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Container(
                          padding: EdgeInsets.only(left: 60, right: 60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(videoListDetails[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      wordSpacing: 3,
                                      letterSpacing: 2,
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                  text: videoListDetails[index].subTile[0],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '   ',
                                    ),
                                    TextSpan(
                                        text:
                                            videoListDetails[index].subTile[1],
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.white,
                                            fontSize: 12)),
                                    TextSpan(
                                      text: '   ',
                                    ),
                                    TextSpan(
                                        text:
                                            videoListDetails[index].subTile[2],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                            fontSize: 14)),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        videoListDetails[index].watched
                            ? Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: 18, right: 18, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Text('WATCHED',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ))))
                            : Container(),
                        Container(
                          padding: EdgeInsets.only(bottom: 25, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              !videoListDetails[index].liked
                                  ? SpringButton(
                                      SpringButtonType.OnlyScale,
                                      Container(
                                          padding: EdgeInsets.only(top: 25),
                                          child: Icon(
                                            LineIcons.thumbs_o_up,
                                            color: Colors.grey,
                                            size: 30,
                                          )),
                                      onTapDown: (_) {},
                                    )
                                  : SpringButton(
                                      SpringButtonType.OnlyScale,
                                      Container(
                                          padding: EdgeInsets.only(top: 25),
                                          child: Icon(
                                            Icons.thumb_up,
                                            color: Colors.grey,
                                            size: 25,
                                          )),
                                      onTapDown: (_) {},
                                    ),
                              SizedBox(width: 10.0),
                              SpringButton(
                                SpringButtonType.OnlyScale,
                                Container(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Icon(
                                      Icons.info_outline,
                                      color: Colors.grey,
                                      size: 30,
                                    )),
                                onTapDown: (_) {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ]),
      ));
    }
    return returnList;
  }
}

class VideoDetails {
  String title;
  List<String> subTile;
  bool watched;
  bool liked;

  VideoDetails(this.title, this.subTile, this.watched, this.liked);
}
