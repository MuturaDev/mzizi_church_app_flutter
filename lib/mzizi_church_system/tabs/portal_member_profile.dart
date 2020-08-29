import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_member_profile_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';

class PortalMemberProfile extends KFDrawerContent {
  VoidCallback onMenuPressedHere;

  PortalMemberProfile({this.onMenuPressedHere});

  @override
  _PortalMemberProfileState createState() => _PortalMemberProfileState();
}

class _PortalMemberProfileState extends State<PortalMemberProfile> {
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
              title: Text('Member Profile',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              centerTitle: true,
            ),
            body: Container(
              color: Color(0xFF487890),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  color: Color(0xFF487890),
                  child: EnhancedFutureBuilder(
                      future: ApiController.sendRequestForPortalMemberProfile(),
                      rememberFutureResult: false,
                      whenDone: (dynamic data) {
                        Widget noContent = Center(
                          child: Text('No content to show',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.amber)),
                        );

                        return data == null
                            ? noContent
                            : data=="" ? noContent : body(data);
                      },
                      whenNotDone: Center(
                        child: Image.asset(
                            'assets/images/member_app_assets/Curve-Loading.gif'),
                      ))),
            )),
      ),
    );
  }

  Widget body(PortalMemberProfileModel response) {
    return Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 5,
              right: 5,
              child: Container(
                padding:
                    EdgeInsets.only(top: 70, bottom: 15, right: 5, left: 5),
                child: Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 400,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 50),
                            TextFormField(
                                enabled: false,
                                initialValue: response.StudentFullName,
                                autovalidate: false,
                                validator: (dynamic value) {
                                  if (value.isEmpty) {
                                    return 'Please input the amount';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Full Name',
                                  //errorText: 'Please input the amount',
                                  border: OutlineInputBorder(),
                                  // suffixIcon: Icon(
                                  //   Icons.error,
                                  // )),
                                )),
                            SizedBox(height: 20),
                            TextFormField(
                                enabled: false,
                                initialValue: response.SchoolName,
                                autovalidate: false,
                                validator: (dynamic value) {
                                  if (value.isEmpty) {
                                    return 'Please input the amount';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Church Name',
                                  //errorText: 'Please input the amount',
                                  border: OutlineInputBorder(),
                                  // suffixIcon: Icon(
                                  //   Icons.error,
                                  // )),
                                )),
                            SizedBox(height: 20),
                            TextFormField(
                                enabled: false,
                                initialValue: response.GroupName,
                                autovalidate: false,
                                validator: (dynamic value) {
                                  if (value.isEmpty) {
                                    return 'Please input the amount';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Group',
                                  //errorText: 'Please input the amount',
                                  border: OutlineInputBorder(),
                                  // suffixIcon: Icon(
                                  //   Icons.error,
                                  // )),
                                )),
                            SizedBox(height: 20),
                            TextFormField(
                                enabled: false,
                                initialValue: response.StudentPhoneNo,
                                autovalidate: false,
                                validator: (dynamic value) {
                                  if (value.isEmpty) {
                                    return 'Please input the amount';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  //errorText: 'Please input the amount',
                                  border: OutlineInputBorder(),
                                  // suffixIcon: Icon(
                                  //   Icons.error,
                                  // )),
                                )),
                          ]),
                    )),
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              right: 10,
              child: Container(
                width: 100,
                height: 100,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: Color(0xFF487890),
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
