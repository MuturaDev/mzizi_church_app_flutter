import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mzizichurchsystem/mzizi_church_system/flavor_mzizi_church_system/flavour_config.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

String selectedUrl = 'https://flutter.io';

// ignore: prefer_collection_literals
final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

class BWMCWebView extends StatelessWidget {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: WillPopScope(
          onWillPop: (){
            Navigator.of(context).pop();
          },
                  child: WebviewScaffold(
            url: FlavourConfig.isBwmc()
                        ? 'https://mpcmsa.org/'
                        : FlavourConfig.isDcik()
                            ? 'https://www.dckasarani.org/'
                            : FlavourConfig.isJcc()
                                ? 'http://www.jccmombasa.org/'
                                : FlavourConfig.isMzizicms() ? 'https://church.mzizi.co.ke/' : 'https://church.mzizi.co.ke/',
            javascriptChannels: jsChannels,
            mediaPlaybackRequiresUserGesture: false,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color(0xFF487890),
              title: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: FlavourConfig.isBwmc()
                        ? 'The Bible '
                        : FlavourConfig.isDcik()
                            ? 'Deliverance Church '
                            : FlavourConfig.isJcc()
                                ? 'Jubilee Christian '
                                : FlavourConfig.isMzizicms() ? 'Mzizi' : 'Mzizi',
                    style: GoogleFonts.portLligatSans(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: FlavourConfig.isBwmc()
                            ? ' Way Ministries'
                            : FlavourConfig.isDcik()
                                ? ' International Kasarani'
                                : FlavourConfig.isJcc()
                                    ? ' Church'
                                    : FlavourConfig.isMzizicms() ? 'CMS' : 'CMS',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      TextSpan(
                        text: '\n Website',
                        style:
                            TextStyle(color: Colors.white, fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                    ]),
              ),
            ),
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            initialChild: Container(
              color: Color(0xFF487890),
              child: Center(
                  child: Container(
                height: 200,
                width: 200,
                //padding: EdgeInsets.all(30),
                child: Image.asset(
                    "assets/images/member_app_assets/Curve-Loading.gif"),
              )), //Text('loading.....', ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Color(0xFF487890),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios,color: Colors.white ),
                    onPressed: () {
                      flutterWebViewPlugin.goBack();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () {
                      flutterWebViewPlugin.goForward();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.autorenew, color: Colors.white),
                    onPressed: () {
                      flutterWebViewPlugin.reload();
                    },
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.fullscreen),
                  //   onPressed: () {
                  //     flutterWebViewPlugin.launch(selectedUrl);
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Instance of WebView plugin
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  // On destroy stream
  StreamSubscription _onDestroy;

  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;

  // On urlChanged stream
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  StreamSubscription<WebViewHttpError> _onHttpError;

  StreamSubscription<double> _onProgressChanged;

  StreamSubscription<double> _onScrollYChanged;

  StreamSubscription<double> _onScrollXChanged;

  final _urlCtrl = TextEditingController(text: selectedUrl);

  final _codeCtrl = TextEditingController(text: 'window.navigator.userAgent');

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _history = [];

  @override
  void initState() {
    super.initState();

    flutterWebViewPlugin.close();

    _urlCtrl.addListener(() {
      selectedUrl = _urlCtrl.text;
    });

    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = flutterWebViewPlugin.onDestroy.listen((_) {
      if (mounted) {
        // Actions like show a info toast.
        _scaffoldKey.currentState.showSnackBar(
            const SnackBar(content: const Text('Webview Destroyed')));
      }
    });

    // Add a listener to on url changed
    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          _history.add('onUrlChanged: $url');
        });
      }
    });

    _onProgressChanged =
        flutterWebViewPlugin.onProgressChanged.listen((double progress) {
      if (mounted) {
        setState(() {
          _history.add('onProgressChanged: $progress');
        });
      }
    });

    _onScrollYChanged =
        flutterWebViewPlugin.onScrollYChanged.listen((double y) {
      if (mounted) {
        setState(() {
          _history.add('Scroll in Y Direction: $y');
        });
      }
    });

    _onScrollXChanged =
        flutterWebViewPlugin.onScrollXChanged.listen((double x) {
      if (mounted) {
        setState(() {
          _history.add('Scroll in X Direction: $x');
        });
      }
    });

    _onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (mounted) {
        setState(() {
          _history.add('onStateChanged: ${state.type} ${state.url}');
        });
      }
    });

    _onHttpError =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) {
      if (mounted) {
        setState(() {
          _history.add('onHttpError: ${error.code} ${error.url}');
        });
      }
    });
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    _onProgressChanged.cancel();
    _onScrollXChanged.cancel();
    _onScrollYChanged.cancel();

    flutterWebViewPlugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24.0),
                child: TextField(controller: _urlCtrl),
              ),
              RaisedButton(
                onPressed: () {
                  flutterWebViewPlugin.launch(
                    selectedUrl,
                    rect: Rect.fromLTWH(
                        0.0, 0.0, MediaQuery.of(context).size.width, 300.0),
                    userAgent: kAndroidUserAgent,
                    invalidUrlRegex:
                        r'^(https).+(twitter)', // prevent redirecting to twitter when user click on its icon in flutter website
                  );
                },
                child: const Text('Open Webview (rect)'),
              ),
              RaisedButton(
                onPressed: () {
                  flutterWebViewPlugin.launch(selectedUrl, hidden: true);
                },
                child: const Text('Open "hidden" Webview'),
              ),
              RaisedButton(
                onPressed: () {
                  flutterWebViewPlugin.launch(selectedUrl);
                },
                child: const Text('Open Fullscreen Webview'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/widget');
                },
                child: const Text('Open widget webview'),
              ),
              Container(
                padding: const EdgeInsets.all(24.0),
                child: TextField(controller: _codeCtrl),
              ),
              RaisedButton(
                onPressed: () {
                  final future =
                      flutterWebViewPlugin.evalJavascript(_codeCtrl.text);
                  future.then((String result) {
                    setState(() {
                      _history.add('eval: $result');
                    });
                  });
                },
                child: const Text('Eval some javascript'),
              ),
              RaisedButton(
                onPressed: () {
                  final future = flutterWebViewPlugin
                      .evalJavascript('alert("Hello World");');
                  future.then((String result) {
                    setState(() {
                      _history.add('eval: $result');
                    });
                  });
                },
                child: const Text('Eval javascript alert()'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _history.clear();
                  });
                  flutterWebViewPlugin.close();
                },
                child: const Text('Close'),
              ),
              RaisedButton(
                onPressed: () {
                  flutterWebViewPlugin.getCookies().then((m) {
                    setState(() {
                      _history.add('cookies: $m');
                    });
                  });
                },
                child: const Text('Cookies'),
              ),
              Text(_history.join('\n'))
            ],
          ),
        ),
      ),
    );
  }
}
