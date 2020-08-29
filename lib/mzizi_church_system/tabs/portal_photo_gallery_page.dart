import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_app_get_portal_photo_gallery.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
import 'package:transparent_image/transparent_image.dart';

class PortalPhotoGalleryPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  PortalPhotoGalleryPage({this.onMenuPressedHere});
  @override
  _PortalPhotoGalleryPageState createState() => _PortalPhotoGalleryPageState();
}

class _PortalPhotoGalleryPageState extends State<PortalPhotoGalleryPage> {
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
            title: Text('Photo Gallery',
                style: TextStyle(
                  fontSize: 20,
                )),
            centerTitle: true,
          ),
          body: Container(
              color: Color(0xFF487890),
              child: EnhancedFutureBuilder(
                  future:
                      ApiController.sendRequestForPortalPortalPhotoGallery(),
                  rememberFutureResult: true,
                  whenDone: (dynamic data) {
                    Widget noContent = Center(
                      child: Text('No content to show',
                          style: TextStyle(fontSize: 15, color: Colors.amber)),
                    );

                    return data == null
                        ? noContent
                        : data.length <= 0
                            ? noContent
                            : GridView.count(
                                primary: false,
                                padding: const EdgeInsets.all(5),
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                children: List.generate(data.length, (index) {
                                  return listItemWidget(data[index]);
                                }),
                              );
                  },
                  whenNotDone: Center(
                    child: Image.asset(
                        'assets/images/member_app_assets/Curve-Loading.gif'),
                  ))),
        ),
      ),
    );
  }

  Widget listItemWidget(PortalPhotoGallery response) {
    return GestureDetector(
      onTap: () {
        // RouteController.routeMethod(17,
        //           controller: Controller.DashboardScreen, context: context);//causing a dashboardscreen

        RouteController.routeMethod(17,
            controller: Controller.Navigator,
            context: context,
            messagepass: response); //causing a dashboardscreen
      },
      child: Container(
        child: Card(
          color: Colors.white,
          child: Container(
              child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 50,
                child: Center(
                    child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  // child: Stack(
                  //   children: <Widget>[
                  //     Center(child: CircularProgressIndicator()),
                  //     Center(
                  //       child: FadeInImage.memoryNetwork(
                  //         placeholder: kTransparentImage,
                  //         image:
                  //             'https://church.mzizi.co.ke//portal/PhotoGallery/3/Bolts%20And%20Nuts/0Z7A5634.JPG',
                  //         fit: BoxFit.fill,
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  child: FadeInImage.assetNetwork(
                    placeholder:
                        'assets/images/member_app_assets/Curve-Loading.gif',
                    image: response.albumphotos[0].imageLink,
                    fit: BoxFit.fill,
                  ),
                  // )
                  // child: Container(color: Colors.white,
                  //     child: Image.network('https://church.mzizi.co.ke/portal/PhotoGallery/3/Bolts%20And%20Nuts/0Z7A5634.JPG', fit: BoxFit.fill, ),
                  //     ),
                )),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                    height: 50,
                    padding:
                        EdgeInsets.only(top: 2, left: 5, right: 5, bottom: 0),
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Text(response.albumName,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              child: Image.asset(
                                  'assets/images/member_app_assets/photo_gallery.png'),
                            )
                          ],
                        ),
                        Text(response.albumPhotoCount + " photos",
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)),
                      ],
                    )),
              )
            ],
          )),
        ),
      ),
    );
  }
}
