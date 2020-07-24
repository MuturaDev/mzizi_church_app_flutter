import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';

class CalendarPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;

  CalendarPage({this.onMenuPressedHere});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final List<String> imgList = [
    // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    //'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'

    // 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fstatic1.squarespace.com%2Fstatic%2F5e31b7774c0dcc6f49c58143%2F5e347e895acf4408944d48b0%2F5e3600bd6ce96b4a791674ca%2F1580597710790%2Ffear_and_faith.jpg%3Fformat%3D1000w&imgrefurl=https%3A%2F%2Fdrumheller.church%2Fevents&tbnid=tDWMxMie7hQfeM&vet=12ahUKEwiX4OyO7LzpAhUNpBoKHSCkD18QMyhUegUIARDHAQ..i&docid=5CifNwwRU04lQM&w=400&h=300&itg=1&q=bible%20events%20pictures&ved=2ahUKEwiX4OyO7LzpAhUNpBoKHSCkD18QMyhUegUIARDHAQ'
    // ,'https://www.google.com/imgres?imgurl=http%3A%2F%2Fse7day.org%2Fimages%2Fslides%2Fl_bible2020_banner-2.jpg&imgrefurl=http%3A%2F%2Fse7day.org%2Fcomponent%2Fflexicontent%2F23%2F761-last-day-events-bible-study-group%3FItemid%3D0%26preview%3D1&tbnid=mGUo7X11Tn-CgM&vet=12ahUKEwiX4OyO7LzpAhUNpBoKHSCkD18QMyhbegUIARDWAQ..i&docid=OVpW5YvhoFRFCM&w=685&h=380&itg=1&q=bible%20events%20pictures&ved=2ahUKEwiX4OyO7LzpAhUNpBoKHSCkD18QMyhbegUIARDWAQ'
    // ,'https://www.google.com/imgres?imgurl=http%3A%2F%2Fcatholicmom.com%2Fwp-content%2Fuploads%2F2019%2F07%2FGreat-Adventure-Bible.jpg&imgrefurl=https%3A%2F%2Fcatholicmom.com%2F2019%2F07%2F29%2Fascension-celebrates-15-year-anniversary-of-great-adventure-bible-timeline-study-with-two-landmark-live-events%2F&tbnid=MjW5pIJvcG94kM&vet=10CCgQMyh3ahcKEwjQivKu7LzpAhUAAAAAHQAAAAAQAg..i&docid=H10N-MCHoIBzoM&w=720&h=340&q=bible%20events%20pictures&ved=0CCgQMyh3ahcKEwjQivKu7LzpAhUAAAAAHQAAAAAQAg'
    // ,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.evbuc.com%2Fhttps%253A%252F%252Fcdn.evbuc.com%252Fimages%252F100585974%252F189628740969%252F1%252Foriginal.20200509-180952%3Fh%3D230%26w%3D460%26auto%3Dformat%252Ccompress%26q%3D75%26sharp%3D10%26rect%3D0%252C9%252C996%252C498%26s%3D2f5b4931b4d5c96416f5f4ac5d30342f&imgrefurl=https%3A%2F%2Fwww.eventbrite.com%2Fe%2Fthe-sweet-life-bible-study-may-19-2020-tickets-79888742379&tbnid=KlholwLCn23eYM&vet=10CGIQMyiUAWoXChMI0Iryruy86QIVAAAAAB0AAAAAEAI..i&docid=hIbIifbryF9zuM&w=460&h=230&q=bible%20events%20pictures&ved=0CGIQMyiUAWoXChMI0Iryruy86QIVAAAAAB0AAAAAEAI'
    // ,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.ytimg.com%2Fvi%2FgdaNvOUym_U%2Fhqdefault.jpg&imgrefurl=https%3A%2F%2Fphuketnews.easybranches.com%2Fevents%2F5893553&tbnid=x8uoui_vIA9hkM&vet=10CHIQMyicAWoXChMI0Iryruy86QIVAAAAAB0AAAAAEAI..i&docid=jTmoc71h6V5wdM&w=480&h=360&itg=1&q=bible%20events%20pictures&ved=0CHIQMyicAWoXChMI0Iryruy86QIVAAAAAB0AAAAAEAI'
    //'https://www.google.com/imgres?imgurl=https%3A%2F%2F412teens.org%2Fqna%2F.images%2FBible-overthinking-700px.jpg&imgrefurl=https%3A%2F%2F412teens.org%2Fqna%2Fwhat-does-the-Bible-say-about-overthinking.php&tbnid=kiBGTcjIc-1uSM&vet=10CKQBEDMotQFqFwoTCNCK8q7svOkCFQAAAAAdAAAAABAC..i&docid=ToiYyYysPhll9M&w=700&h=368&q=bible%20events%20pictures&ved=0CKQBEDMotQFqFwoTCNCK8q7svOkCFQAAAAAdAAAAABAC'
    'https://imagizer.imageshack.com/img922/1959/IaIQx8.jpg',
    'https://imagizer.imageshack.com/img924/7272/YYCa8d.jpg',
    'https://imagizer.imageshack.com/img924/3559/QWs8fu.jpg',
    'https://imagizer.imageshack.com/img923/268/u1cHRX.jpg',
    'https://imagizer.imageshack.com/img924/7841/QwipFB.jpg',
    'https://imagizer.imageshack.com/img923/1769/wTyQhO.jpg'
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(0.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          item,
                          fit: BoxFit.fill,
                          width: 1000,
                          height: MediaQuery.of(context).size.height / 2 - 50,
                          // loadingBuilder: (context, child, progress) {
                          //   return progress == null
                          //       ? child
                          //       : LinearProgressIndicator(backgroundColor: Colors.black,);
                          // },
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              //'No. ${imgList.indexOf(item)} image',
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //ANNOUNCEMENT SECTION
            Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      // height: MediaQuery.of(context).size.height/2,
                      //https://github.com/serenader2014/flutter_carousel_slider/blob/master/example/lib/main.dart
                      child: Container(
                        child: Stack(children: [
                          CarouselSlider(
                            items: imageSliders,
                            options: CarouselOptions(
                                height:
                                    MediaQuery.of(context).size.height / 2 - 50,
                                viewportFraction: 1.0,
                                autoPlay: true,
                                autoPlayInterval: Duration(milliseconds: 10000),
                                enlargeCenterPage: false,
                                // aspectRatio: 2.0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 2 - 90,
                            right: 0.0,
                            left: 0.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imgList.map((url) {
                                int index = imgList.indexOf(url);
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? Colors.white
                                        : Color(0xFF487890),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ]),
                      ),

                      // Image(
                      //   // height: MediaQuery.of(context).size.height/2,
                      //   // width: double.infinity,
                      //   image: AssetImage(
                      //       "assets/images/member_app_assets/dashboard_home_bg.jpg"),
                      // ),
                    )),
                Positioned(
                  top: 30.0,
                  left: 5.0,
                  right: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ClipRRect(
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
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: 'TUESDAY',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: 'MontserratBold',
                                color: Colors.white,
                                fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                text: '   ',
                              ),
                              TextSpan(
                                  text: 'March 5, 2016',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Container(
                          height: 28.0,
                          width: 28.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Center(
                              child: Text(
                            "10",
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                child: Stack(children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.only(top: 16),
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(height: 1, color: Colors.grey[200]);
                      },
                      physics: ClampingScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return (index % 2) == 0
                            ? dashboardBottomListViewItemWidget(
                                new CommunicationModel(
                                    Icons.pin_drop,
                                    "Check In",
                                    ['to', "CHILDCARE, BIBLE STUDY..."]))
                            : Column(
                                children: <Widget>[
                                  dashboardBottomListViewItemEventsWidget(
                                      new WeekDayEventModel(
                                    "WEDNESDAY",
                                    1 == 1
                                        ? "1" + " " + "Event this week"
                                        : "5" + " " + "Events this week",
                                    Image.network(
                                      "https://imagizer.imageshack.com/img922/1959/IaIQx8.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                    "Women\'s Bible Study",
                                    ["for", "SARAH"],
                                  )),
                                  dashboardBottomListViewItemEventsWidget(
                                      new WeekDayEventModel(
                                    "WEDNESDAY",
                                    "5" + "Event(s) this week",
                                    Image.network(
                                      "https://imagizer.imageshack.com/img922/1959/IaIQx8.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                    "Women\'s Bible Study",
                                    ["for", "SARAH"],
                                  ))
                                ],
                              );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    margin: EdgeInsets.all(0),
                    height: 40,
                    color: Color(0xFF487890),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  text: 'TODAY',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white,
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(text: "   "),
                                    TextSpan(
                                        text: '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.white,
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            )
          ]),
    ));
  }

  Widget dashboardBottomListViewItemWidget(CommunicationModel communication) {
    return Column(children: <Widget>[
      Container(
        //color: Colors.greenAccent,
        padding: EdgeInsets.only(left: 20.0, right: 10),
        height: 120.0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(
                  communication.icon,
                  color: Color(0xFF487890),
                  size: 40,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(communication.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w400)),
                      RichText(
                        text: TextSpan(
                          text: communication.subTitle[0],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[300],
                              fontSize: 13),
                          children: <TextSpan>[
                            TextSpan(text: " "),
                            TextSpan(
                                text: communication.subTitle[1],
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF7DACC6),
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                    ]),
              ),
              SpringButton(
                SpringButtonType.OnlyScale,
                // row(
                //   "Increment",
                //   Colors.deepPurpleAccent,
                // ),
                Container(
                    child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
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
            ],
          ),
        ),
      ),
      SizedBox(
          height: 1,
          width: double.infinity,
          child: Container(color: Colors.grey[200])),
    ]);
  }

  Widget dashboardBottomListViewItemEventsWidget(
      WeekDayEventModel communication) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              color: Colors.grey[300],
              padding: EdgeInsets.only(left: 20.0, right: 10),
              height: 200.0,
              child: Center(
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(communication.day,
                              //"kjdlja",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900)),
                          Text(
                              //'ldjald',
                              communication.noOfThisSpecificEvent,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900)),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 130,
                              width: 110,
                              child: communication.image,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  border: Border.all(
                                      width: 4, color: Colors.white)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(communication.title,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400)),
                                    RichText(
                                      text: TextSpan(
                                        text: communication.subTitle[0],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey[500],
                                            fontSize: 13),
                                        children: <TextSpan>[
                                          TextSpan(text: " "),
                                          TextSpan(
                                              text: communication.subTitle[1],
                                              style: TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w900,
                                                  color: Color(0xFF7DACC6),
                                                  fontSize: 15)),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                            SpringButton(
                              SpringButtonType.OnlyScale,
                              // row(
                              //   "Increment",
                              //   Colors.deepPurpleAccent,
                              // ),
                              Container(
                                  child: Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
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
                          ],
                        ),
                      ),
                    ]),
              )),
          SizedBox(
              height: 2,
              width: double.infinity,
              child: Container(color: Colors.grey[400])),
        ]);
  }
}

class CommunicationModel {
  IconData icon;
  String title;
  List<String> subTitle;

  CommunicationModel(IconData icon, String title, List<String> subTitle) {
    this.icon = icon;
    this.title = title;
    this.subTitle = subTitle;
  }
}

class WeekDayEventModel {
  String day;
  String noOfThisSpecificEvent;
  Image image;
  String title;
  List<String> subTitle;

  WeekDayEventModel(String day, String noOfThisSpecificEvent, Image image,
      String title, List<String> subTitle) {
    this.day = day;
    this.noOfThisSpecificEvent = noOfThisSpecificEvent;
    this.image = image;
    this.title = title;
    this.subTitle = subTitle;
  }
}
