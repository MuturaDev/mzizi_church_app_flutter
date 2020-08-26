import 'package:add_thumbnail/add_thumbnail.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/progress_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/example_screens/login_page_example.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_video_gallery_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PortalVideoGalleryPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  PortalVideoGalleryPage({this.onMenuPressedHere});
  @override
  _PortalVideoGalleryPageState createState() => _PortalVideoGalleryPageState();
}

class _PortalVideoGalleryPageState extends State<PortalVideoGalleryPage> {
  @override
  static String selectedvideo = "";

  List<MediaInfo> mediaList = [];
  List<String> urlList = ["https://www.youtube.com/watch?v=uv54ec8Pg1k"];

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
              future:  ApiController.sendReqeustForPortalVideoGallery(), 
              rememberFutureResult: true, 
              whenDone: (dynamic data){
                return body(data);
              }, 
              whenNotDone: Center(child: Image.asset("assets/images/member_app_assets/Curve-Loading.gif"))),
      ),)
    );
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

  
  Widget body(final List<PortalVideoGalleryResponseModel> responseList) {

    if(selectedvideo.isEmpty && responseList.isNotEmpty){
      selectedvideo = UtilityFunctions.getVideoIDFromYoutubeUrl(responseList[0].VideoLink);
    }

  YoutubePlayerController _youtubeController = YoutubePlayerController(
        initialVideoId: selectedvideo,
        flags: YoutubePlayerFlags(
          autoPlay: false,
        ));


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
                      actionsPadding: EdgeInsets.only(left: 16.0),
                      bottomActions: [
                        CurrentPosition(),
                        SizedBox(width: 10.0),
                        ProgressBar(isExpanded: true),
                        SizedBox(width: 10.0),
                        RemainingDuration(),
                       // FullScreenButton(),
                      ],
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

  Widget listItemWidget(final PortalVideoGalleryResponseModel response) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedvideo = UtilityFunctions.getVideoIDFromYoutubeUrl(response.VideoLink);
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
                  width: 250,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          response.Name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: Text(
                            response.Body,
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
                  child: MediaListView(
                    titleTextStyle: TextStyle(color: Colors.white),
                    titleTextBackGroundColor: Colors.grey,
                    overlayChild: Icon(Icons.save),
                    urls: ["https://www.youtube.com/watch?v=" + UtilityFunctions.getVideoIDFromYoutubeUrl(response.VideoLink)],
                    mediaList: mediaList,
                    onPressed: (url) {
                      //print(url);
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
