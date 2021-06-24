import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/spring_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/authenticate_user_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/dao/portal_todo_list_dao.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/portal_student_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_to_do_list_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';

class HomeAnnouncements extends StatelessWidget {
  Future<dynamic> _optionToFetchOnline() async {
    PortalTodoListDAO dao = new PortalTodoListDAO();

    try {
      if (await UtilityFunctions.checkConnection()) {
        Student student = await AuthenticateUserDAO().getStudent();
        // Student student = new Student("23309", "1000");
        if (student != null) {
          final dynamic transactions =
              await ApiController.sendRequestForPortalToDoList(student);

          await dao.deletePortalToDoLists();

          await dao.insertPortalTodoList(transactions);

          return await dao.getPortalToDoLists();
        } else {
          return dao.getPortalToDoLists();
        }
      } else {
        return dao.getPortalToDoLists();
      }
    } catch (e) {
      return dao.getPortalToDoLists();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
      Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xFF487890), width: 1.5))),
        padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 0),
        width: double.infinity,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 25.0,
                    width: 25.0,
                    child: Image.asset(
                        'assets/images/member_app_assets/megaphone.png')),
                SizedBox(width: 5),
                Text("Announcements, Sermons",
                    style: TextStyle(color: Color(0xFF487890), fontSize: 15))
              ],
            ),
            SpringButton(
              SpringButtonType.OnlyScale,
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 18, right: 18, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFF487890), width: 1.0),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text('More',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF487890),
                          )))),
              onTapDown: (_) {
                RouteController.routeMethod(6,
                    controller: Controller.Navigator, context: context);
              },
            )
          ],
        ),
      ),
      Container(
        height: 150,
        child: EnhancedFutureBuilder(
            future: _optionToFetchOnline(),
            rememberFutureResult: true,
            whenDone: (dynamic data) {
              List<PortalToDoList> portalToDoList = data;

              Widget noContent = Center(
                child: Text('No content to show',
                    style: TextStyle(fontSize: 15, color: Colors.amber)),
              );

              return data == null
                  ? noContent
                  : data.length <= 0
                      ? noContent
                      : ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return announcementListViewItemWidget(
                                portalToDoList[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                                child: Container(color: Colors.grey),
                                width: double.infinity,
                                height: 1);
                          },
                          itemCount: portalToDoList.length);
            },
            whenNotDone: Center(
              child: Image.asset(
                  "assets/images/member_app_assets/Curve-Loading.gif"),
            )),
      ),
    ]));
  }

  Widget announcementListViewItemWidget(PortalToDoList portalToDo) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Color(0xFF487890),
        ),
        padding: EdgeInsets.all(10.0),
        child: Text(portalToDo.DiaryEntryType,
            style: TextStyle(fontSize: 15, color: Colors.white)),
      ),
    );
  }
}
