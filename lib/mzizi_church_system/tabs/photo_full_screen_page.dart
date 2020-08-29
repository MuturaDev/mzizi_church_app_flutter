import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_app_get_portal_photo_gallery.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';

class PhotoFullScreen extends KFDrawerContent {
  PortalPhotoGallery messagepass;
  PhotoFullScreen(this.messagepass);
  @override
  _PhotoFullScreenState createState() => _PhotoFullScreenState();
}

/*GestureDetector(
              onTap: () {
                RouteController.routeMethod(0,
                    controller: Controller.Navigator,
                    context: context); //causing a dashboardscreen
              },
              child: Icon(Icons.arrow_back, color: Colors.black, size: 24)) */

class _PhotoFullScreenState extends State<PhotoFullScreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.messagepass.albumphotos
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(0.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          item.imageLink,
                          fit: BoxFit.fill,
                          width: double.infinity,
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

    Future<bool> _onBackPressed() {
      RouteController.routeMethod(0,
          controller: Controller.Navigator, context: context);
    }

    return Container(
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          body: Container(
              child: Stack(
            children: <Widget>[
              Positioned(
                  top: 60,
                  right: 10,
                  left: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            RouteController.routeMethod(15,
                                controller: Controller.Navigator,
                                context: context); //causing a dashboardscreen
                          },
                          child: Icon(Icons.arrow_back,
                              color: Colors.black, size: 24))
                    ],
                  )),
              Positioned(
                  top: 0,
                  right: 5,
                  left: 5,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.only(top: 100),
                    margin: EdgeInsets.all(5),
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Container(
                        //color: Colors.red,
                        child: Stack(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  // height: MediaQuery.of(context).size.height/2,
                                  //https://github.com/serenader2014/flutter_carousel_slider/blob/master/example/lib/main.dart
                                  child: Container(
                                    child: Center(
                                      child: Stack(children: [
                                        CarouselSlider(
                                          items: imageSliders,
                                          options: CarouselOptions(
                                              height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      2 -
                                                  100,
                                              viewportFraction: 1.0,
                                              autoPlay: true,
                                              autoPlayInterval:
                                                  Duration(milliseconds: 10000),
                                              enlargeCenterPage: false,
                                              // aspectRatio: 2.0,
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  _current = index;
                                                });
                                              }),
                                        ),
                                        Positioned(
                                          top: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2 -
                                              150,
                                          right: 0.0,
                                          left: 0.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: widget
                                                .messagepass.albumphotos
                                                .map((url) {
                                              int index = widget
                                                  .messagepass.albumphotos
                                                  .indexOf(url);
                                              return Container(
                                                width: 8.0,
                                                height: 8.0,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10.0),
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
                                  ),

                                  // Image(
                                  //   // height: MediaQuery.of(context).size.height/2,
                                  //   // width: double.infinity,
                                  //   image: AssetImage(
                                  //       "assets/images/member_app_assets/dashboard_home_bg.jpg"),
                                  // ),
                                )),
                            Container(
                              width: double.infinity,
                              height: 30,
                              child: Center(
                                child: Text(widget.messagepass.albumName,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
