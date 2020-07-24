import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';

class EventDetailsPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;

  EventDetailsPage({this.onMenuPressedHere});

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final List<String> imgList = [
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
              ],
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                

              ),
            )
          ]),
    ));
  }

}
