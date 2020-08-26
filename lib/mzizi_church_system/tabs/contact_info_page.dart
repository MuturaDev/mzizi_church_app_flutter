import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/portal_contacts_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_contacts_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_widgets.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';

class PortalContactInfoPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  PortalContactInfoPage({this.onMenuPressedHere});

  @override
  _CheckInpageState createState() => _CheckInpageState();
}

class _CheckInpageState extends State<PortalContactInfoPage> {
  Future<dynamic> _optionToFetchOnline() async {
    PortalContactsDAO dao = new PortalContactsDAO();

    try {
      if (await UtilityFunctions.checkConnection()) {
        //Student student = await AuthenticateUserDAO().getStudent();
        Student student = new Student("23309", "1000");
        if (student != null) {
          final dynamic transactions =
              await ApiController.sendRequestForPortalContacts(student);

          await dao.deletePortalContacts(await dao.getPortalContacts());

          await dao.insertPortalContacts(transactions);

          return await dao.getPortalContacts();
        } else {
          return dao.getPortalContacts();
        }
      } else {
        return dao.getPortalContacts();
      }
    } catch (e) {
      return dao.getPortalContacts();
    }
  }

  @override
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
          title: Text('Contact Info',
              style: TextStyle(
                fontSize: 20,
              )),
          centerTitle: true,
          // actions: <Widget>[
          //   SpringButton(
          //     SpringButtonType.OnlyScale,
          //     Container(
          //       child: Icon(LineIcons.paper_plane),
          //     ),
          //     onTapDown: (_) {},
          //   ),
          //   SizedBox(width: 10),
          //   Container(
          //       child: FaIcon(FontAwesomeIcons.donate, size: 20, color: Colors.red,),
          //     ),
          //   SpringButton(
          //     SpringButtonType.OnlyScale,
          //     Container(
          //       child: Icon(Icons.refresh),
          //     ),
          //     onTapDown: (_) {},
          //   ),
          // ],
        ),
        body: Container(
          color: Color(0xFF487890),
          child: EnhancedFutureBuilder(
              future: _optionToFetchOnline(),
              whenNotDone: Center(
                  child: Container(
                height: 250,
                width: 250,
                padding: EdgeInsets.all(0),
                child: Image.asset(
                    "assets/images/member_app_assets/Curve-Loading.gif"),
              )),
              rememberFutureResult: false,
              whenDone: (dynamic data) {
                List<PortalContacts> _contactList = data;
                return Container(
                  color: Color(0xFF487890),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 30,
                          left: 5,
                          right: 5,
                          child: Container(
                              padding: EdgeInsets.only(
                                  top: 70, bottom: 15, right: 5, left: 5),
                              child: Card(
                                  elevation: 5,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: double.infinity,
                                    height: 500,
                                    child: _contactList == null
                                        ? _noContentWidget(context)
                                        : _contactList.length <= 0
                                            ? _noContentWidget(context)
                                            : Container(
                                                padding: EdgeInsets.all(5.0),
                                                margin: EdgeInsets.only(
                                                    top: 30.0, bottom: 5.0),
                                                child: RefreshIndicator(
                                                  child: ListView.builder(
                                                    itemCount:
                                                        _contactList.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return _buildListViewItemWidget(
                                                          leftLabel:
                                                              _contactList[
                                                                      index]
                                                                  .SettingName,
                                                          rightLabel:
                                                              _contactList[
                                                                      index]
                                                                  .SettingValue);
                                                    },
                                                  ),
                                                  onRefresh: () async {
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                  )))),
                      Positioned(
                        top: 50,
                        left: 10,
                        right: 10,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            child: Icon(
                              Icons.contact_mail,
                              color: Color(0xFF487890),
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget _buildListViewItemWidget({String leftLabel, String rightLabel}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: CustomTextFormField(
        initialValue: rightLabel,
        labelText: leftLabel.replaceAll("Institution", "Church"),
      ),
    );
  }

  Widget _noContentWidget(BuildContext context) => Center(
        child: Text(
          'No school contact details to show',
          style: TextStyle(
              color: Colors.green,
              fontSize: 13.0,
              fontWeight: FontWeight.normal),
        ),
      );
}
