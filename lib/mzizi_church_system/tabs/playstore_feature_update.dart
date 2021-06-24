import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:mzizichurchsystem/mzizi_church_system/flavor_mzizi_church_system/flavour_config.dart';

class PlaystoreFeatureUpdate extends StatefulWidget {
  @override
  _PlaystoreFeatureUpdateState createState() => _PlaystoreFeatureUpdateState();
}

class _PlaystoreFeatureUpdateState extends State<PlaystoreFeatureUpdate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          backgroundColor: Color(0xFF487890),
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        FlavourConfig.isBwmc()
                            ? 'assets/images/member_app_assets/ic_bwmc_logo.png'
                            : FlavourConfig.isDcik()
                                ? 'assets/images/member_app_assets/ic_dcik_logo.png'
                                : FlavourConfig.isJcc()
                                    ? 'assets/images/member_app_assets/ic_jcc_logo.png'
                                    : FlavourConfig.isMzizicms()
                                        ? 'assets/images/member_app_assets/ic_mzizicms_logo.png'
                                        : 'assets/images/member_app_assets/ic_mzizicms_logo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        child: Text(
                            FlavourConfig.isBwmc()
                                ? 'BWMC needs an update'
                                : FlavourConfig.isDcik()
                                    ? 'DCIK needs an update'
                                    : FlavourConfig.isJcc()
                                        ? 'JCC needs an update'
                                        : FlavourConfig.isMzizicms()
                                            ? 'MZIZICMS needs an update'
                                            : 'MZIZICMS needs an update',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            )))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    child: Text('To use this app, download the latest version',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: 13,
                        ))),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: RaisedButton(
                      elevation: 5,
                      color: Colors.blue,
                      onPressed: () {
                        //mobile.ultratude.com.mzizichurchsystem.bwmc
                        //mobile.ultratude.com.mzizichurchsystem.bwmc&hl=en
                        LaunchReview.launch(
                          androidAppId: "mobile.ultratude.com.mzizichurchsystem${FlavourConfig.isBwmc()
                                ? '.bwmc'
                                : FlavourConfig.isDcik()
                                    ? '.dcik'
                                    : FlavourConfig.isJcc()
                                        ? '.jcc'
                                        : FlavourConfig.isMzizicms()
                                            ? ''
                                            : ''}",
                          iOSAppId: "585027354",
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Center(
                            child: Text('UPDATE',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15))),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: 150,
                  child: Image.asset(
                      'assets/images/member_app_assets/playstore.png',
                      fit: BoxFit.fill),
                )
              ],
            ),
          )),
    );
  }
}
