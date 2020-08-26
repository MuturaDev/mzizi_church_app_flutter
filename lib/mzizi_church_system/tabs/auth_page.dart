import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AuthPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  AuthPage({this.onMenuPressedHere});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listOfVideoWidget()),
            )),
      ),
    );
  }

  List<Widget> listOfVideoWidget() {
    List<Widget> returnList = new List();

    final List<YoutubePlayerController> _controllers = [
      // 'Sw6BQynR36Q',
      // 'Sw6BQynR36Q',
      // 'Sw6BQynR36Q',
      'Sw6BQynR36Q',
    ]
        .map<YoutubePlayerController>(
          (videoId) => YoutubePlayerController(
            initialVideoId: videoId,
            flags: YoutubePlayerFlags(
              autoPlay: false,
            ),
          ),
        )
        .toList();

    for (int index = 0; index < _controllers.length; index++) {
      returnList.add(YoutubePlayer(
        key: ObjectKey(_controllers[index]),
        controller: _controllers[index],
        actionsPadding: EdgeInsets.only(left: 16.0),
        bottomActions: [
          CurrentPosition(),
          SizedBox(width: 10.0),
          ProgressBar(isExpanded: true),
          SizedBox(width: 10.0),
          RemainingDuration(),
          FullScreenButton(),
        ],
      ));
    }

    return returnList;
  }
}

/* Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: Expanded(
                child: Container(
                  height: 300,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return YoutubePlayer(
                        key: ObjectKey(_controllers[index]),
                        controller: _controllers[index],
                        actionsPadding: EdgeInsets.only(left: 16.0),
                        bottomActions: [
                          CurrentPosition(),
                          SizedBox(width: 10.0),
                          ProgressBar(isExpanded: true),
                          SizedBox(width: 10.0),
                          RemainingDuration(),
                          FullScreenButton(),
                        ],
                      );
                    },
                    itemCount: _controllers.length,
                    separatorBuilder: (context, _) => SizedBox(height: 10.0),
                  ),
                ),
              )),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding:
                  EdgeInsets.only(top: 40, left: 5.0, right: 5.0, bottom: 10),
              color: Colors.black38,
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
                                  color: Colors.green[300],
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
      ), */
