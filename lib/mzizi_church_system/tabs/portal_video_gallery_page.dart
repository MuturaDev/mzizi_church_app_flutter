import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_video_gallery_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PortalVideoGalleryPage extends KFDrawerContent {
  VoidCallback? onMenuPressedHere;
  PortalVideoGalleryPage({this.onMenuPressedHere});
  @override
  _PortalVideoGalleryPageState createState() => _PortalVideoGalleryPageState();
}

class _PortalVideoGalleryPageState extends State<PortalVideoGalleryPage> {
  @override
  static String selectedvideo = "";

  //List<String> urlList = ["https://www.youtube.com/watch?v=uv54ec8Pg1k"];

  Future<bool> _onBackPressed() async {
    RouteController.routeMethod(0,
        controller: Controller.Navigator, context: context);
    return false;
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
              title: Text('Video Gallery',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              centerTitle: true,
            ),
            body: Container(
              padding: EdgeInsets.all(5.0),
              width: double.infinity,
              height: double.infinity,
              color: Color(0xFF487890),
              child: EnhancedFutureBuilder(
                  future: ApiController.sendReqeustForPortalVideoGallery(),
                  rememberFutureResult: true,
                  whenDone: (dynamic data) {
                    Widget noContent = Center(
                      child: Text('No content to show',
                          style: TextStyle(fontSize: 15, color: Colors.amber)),
                    );

                    return data == null
                        ? noContent
                        : data.length <= 0 ? noContent : body(data);
                  },
                  whenNotDone: Center(
                      child: Image.asset(
                          "assets/images/member_app_assets/Curve-Loading.gif"))),
            ),
          ),
        ));
  }

  // final List<YoutubePlayerController> _controllers = [
  //     // 'Sw6BQynR36Q',
  //     // 'Sw6BQynR36Q',
  //     // 'Sw6BQynR36Q',
  //     'Sw6BQynR36Q',
  //   ]
  //       .map<YoutubePlayerController>(
  //         (videoId) => YoutubePlayerController(
  //           initialVideoId: videoId,
  //           flags: YoutubePlayerFlags(
  //             autoPlay: false,
  //           ),
  //         ),
  //       )
  //       .toList();

  Widget body(List<PortalVideoGalleryResponseModel> responseList) {
    if (selectedvideo.isEmpty && responseList.isNotEmpty) {
      selectedvideo =
          UtilityFunctions.getVideoIDFromYoutubeUrl(responseList[0].VideoLink ?? '');
    }

    YoutubePlayerController _youtubeController =
        YoutubePlayerController.fromVideoId(
            videoId: selectedvideo, autoPlay: false);

    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Card(
              elevation: 5,
              child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                    //   child: Text(
                    // selectedvideo.toString(),
                    // style: TextStyle(color: Colors.white, fontSize: 20),
                    child: YoutubePlayer(
                      key: ObjectKey(_youtubeController),
                      controller: _youtubeController,
                    ),
                  )),
            ),
          ),
          Positioned(
            top: 210,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              child: ListView.builder(
                  itemCount: responseList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return listItemWidget(responseList[index]);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItemWidget(PortalVideoGalleryResponseModel response) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedvideo =
              UtilityFunctions.getVideoIDFromYoutubeUrl(response.VideoLink ?? '');
        });
      },
      child: Card(
        elevation: 0,
        child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            height: 150,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10, left: 5),
                  width: 200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          response.Name ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: Text(
                            response.Body ?? '',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 150,
                  width: 130,
                  // YouTube thumbnail (replaces the abandoned add_thumbnail package).
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      "https://img.youtube.com/vi/" +
                          UtilityFunctions.getVideoIDFromYoutubeUrl(
                              response.VideoLink ?? '') +
                          "/hqdefault.jpg",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) =>
                          const Icon(Icons.ondemand_video, size: 48),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
