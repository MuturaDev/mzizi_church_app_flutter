import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SermonSeriesPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  SermonSeriesPage({this.onMenuPressedHere});
  @override
  _SermonSeriesPageState createState() => _SermonSeriesPageState();
}

class _SermonSeriesPageState extends State<SermonSeriesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
          body: Container(
             
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 88,
                    right: 0.0,
                    left: 0.0,
                    bottom: 0.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: listOfVideoWidget()),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 30, left: 5.0, right: 5.0, bottom: 10),
                      color: Colors.black,
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
                                    color: Colors.green[400],
                                    fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '  /  ',
                                  ),
                                  TextSpan(
                                      text: 'SERIES',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
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
      // 'https://imagizer.imageshack.com/img922/1959/IaIQx8.jpg',
      // 'https://imagizer.imageshack.com/img924/7272/YYCa8d.jpg',
      // 'https://imagizer.imageshack.com/img924/3559/QWs8fu.jpg',
      // 'https://imagizer.imageshack.com/img923/268/u1cHRX.jpg',

      // 'https://imagizer.imageshack.com/img922/3212/HuStmM.jpg',
      // 'https://imagizer.imageshack.com/img923/1776/dmcTe1.jpg',
      // 'https://imagizer.imageshack.com/img924/5742/2sEpGu.jpg',
      // 'https://imagizer.imageshack.com/img924/9823/uYlpZp.jpg',

      // 'https://imagizer.imageshack.com/img924/2936/TQGOHA.jpg',
      // 'https://imagizer.imageshack.com/img923/933/E7Aogh.jpg',
      // 'https://imagizer.imageshack.com/img923/991/5tBaU0.jpg',
      // 'https://imagizer.imageshack.com/img922/7779/GVHaET.jpg',

      // 'https://imagizer.imageshack.com/img922/985/tRFYoV.jpg',
      // 'https://imagizer.imageshack.com/img922/1271/cro84Z.jpg',
      // 'https://imagizer.imageshack.com/img924/374/LohA16.jpg',
      // 'https://imagizer.imageshack.com/img923/3454/lksaSB.jpg',

      'https://imagizer.imageshack.com/img923/6161/2TUveM.jpg',
      'https://imagizer.imageshack.com/img924/120/c0yebZ.jpg',
      'https://imagizer.imageshack.com/img924/4274/LXwd4y.jpg',
      'https://imagizer.imageshack.com/img924/1260/o8aVXk.jpg',

      // 'https://imagizer.imageshack.com/img922/1718/mBSaQ7.jpg',
      // 'https://imagizer.imageshack.com/img924/8890/5r7cBB.jpg',
      // 'https://imagizer.imageshack.com/img922/4442/Z9opo6.jpg',
      // 'https://imagizer.imageshack.com/img922/3015/eFmHHf.jpg',
    ];
    //Blur image
    //https://medium.com/fluttervn/how-to-make-blur-effect-in-flutter-using-backdropfilter-imagefilter-559ffd8ab73

    List<VideoList> videoListDetails = new List();
    VideoList videoDetails1 = new VideoList(
      '5 Sermons',
    );
    videoListDetails.add(videoDetails1);
    VideoList videoDetails2 = new VideoList(
      '4 Sermons',
    );
    videoListDetails.add(videoDetails2);
    VideoList videoDetails3 = new VideoList(
      '6 Sermons',
    );
    videoListDetails.add(videoDetails3);
    VideoList videoDetails4 = new VideoList(
      '10 Sermons',
    );
    videoListDetails.add(videoDetails4);

    double height = 300;

    for (int index = 0; index < _videosList.length; index++) {
      returnList.add(Container(
        height: height,
        child: Stack(children: <Widget>[
          Image.network(
            _videosList[index],
            fit: BoxFit.fill,
            height: height,
            width: double.infinity,
          ),
          Container(
            height: height,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 60,
                    color: Colors.black26,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(videoListDetails[index].sermonCountText,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: SpringButton(
                            SpringButtonType.OnlyScale,
                            Container(
                                child: Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 30,
                            )),
                            onTapDown: (_) {},
                          ),
                        ),
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

class VideoList {
  String sermonCountText;
  VideoList(this.sermonCountText);
}
