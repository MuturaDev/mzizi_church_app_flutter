import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mzizichurchsystem/mzizi_church_system/flavor_mzizi_church_system/flavour_config.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// The church's website inside the app, with back / forward / reload controls.
class BWMCWebView extends StatefulWidget {
  const BWMCWebView({super.key});

  @override
  State<BWMCWebView> createState() => _BWMCWebViewState();
}

class _BWMCWebViewState extends State<BWMCWebView> {
  late final WebViewController _controller;
  bool _loading = true;

  static String get _url => FlavourConfig.isBwmc()
      ? 'https://mpcmsa.org/'
      : FlavourConfig.isDcik()
          ? 'https://www.dckasarani.org/'
          : FlavourConfig.isJcc()
              ? 'http://www.jccmombasa.org/'
              : 'https://church.mzizi.co.ke/';

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('Print',
          onMessageReceived: (message) => debugPrint(message.message))
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (_) {
          if (mounted && _loading) setState(() => _loading = false);
        },
      ))
      ..loadRequest(Uri.parse(_url));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF487890),
          iconTheme: const IconThemeData(color: Colors.white),
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: FlavourConfig.isBwmc()
                    ? 'The Bible '
                    : FlavourConfig.isDcik()
                        ? 'Deliverance Church '
                        : FlavourConfig.isJcc()
                            ? 'Jubilee Christian '
                            : 'Mzizi',
                style: GoogleFonts.portLligatSans(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
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
                                : 'CMS',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const TextSpan(
                    text: '\n Website',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontStyle: FontStyle.italic),
                  ),
                ]),
          ),
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_loading)
              Container(
                color: const Color(0xFF487890),
                child: Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                        "assets/images/member_app_assets/Curve-Loading.gif"),
                  ),
                ),
              ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xFF487890),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => _controller.goBack(),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: () => _controller.goForward(),
              ),
              IconButton(
                icon: const Icon(Icons.autorenew, color: Colors.white),
                onPressed: () => _controller.reload(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
