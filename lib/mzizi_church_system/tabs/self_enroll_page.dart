import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/left_drawer_navigation.dart';
import 'package:mzizichurchsystem/mzizi_church_system/UtilWidgets/progress_button.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/request_models/portal_list_onboarding_request_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_list_onboarding_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/retrofit/api_controller.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/routes_changer.dart';
import 'package:mzizichurchsystem/mzizi_church_system/utils/utility_functions.dart';
import 'package:sweetalert/sweetalert.dart';

Map<String, ListOnboardingRequest> selfEnrollPayload;

class SelfEnrollPage extends KFDrawerContent {
  VoidCallback onMenuPressedHere;
  SelfEnrollPage({this.onMenuPressedHere});
  @override
  _SelfEnrollPageState createState() => _SelfEnrollPageState();
}

class _SelfEnrollPageState extends State<SelfEnrollPage> {
  Future<bool> _onBackPressed() {
    RouteController.routeMethod(0,
        controller: Controller.Navigator, context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selfEnrollPayload = new Map();
    selfEnrollPayload.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          backgroundColor: Color(0xFF487890),
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
            title: Text('Self Enroll',
                style: TextStyle(
                  fontSize: 20,
                )),
            centerTitle: true,
          ),
          body: Container(
            // color: Color(0xFF487890),
            padding: EdgeInsets.all(5),
            child: body(),
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            right: 0,
            left: 0,
            bottom: 55,
            child: Container(
                child: EnhancedFutureBuilder(
              future: ApiController.sendRequestForPortalListOnboarding(
                  method: 'GET'),
              rememberFutureResult: false,
              whenDone: (dynamic data) {
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {});
                  },
                  child: Scrollbar(
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        // ListOnboardingRequest payload = null;
                        // for (int i = 0; i < selfEnrollPayload.length; i++) {
                        //   ListOnboardingRequest obj = selfEnrollPayload[i];
                        //   if (obj.ListOnBoardingID == data[index].ID) {
                        //     payload = obj;
                        //   }
                        // }

                        Widget noContent = Center(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Text('No content to show',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.amber)),
                          ),
                        );
                        return null == data
                            ? noContent
                            : data.length <= 0
                                ? noContent
                                : bodyListItemWidget(data[index]);
                      },
                      itemCount:
                          null == data ? 0 : data.length <= 0 ? 0 : data.length,
                    ),
                  ),
                );
              },
              whenNotDone: Center(
                  child: Container(
                height: 250,
                width: 250,
                child: Image.asset(
                    'assets/images/member_app_assets/Curve-Loading.gif'),
              )),
            )),
          ),
          Positioned(
            bottom: 0,
            right: 5,
            left: 5,
            height: 40,
            child: Column(
              children: <Widget>[LoginProgressButton()],
            ),
            //,
          ),
        ],
      ),
    );
  }

  Widget bodyListItemWidget(PortalListOnboardingResponseModel response) {
    return SelfEnrollItemWidget(response);
  }
}

class LoginProgressButton extends StatefulWidget {
  // _PortalContributionsPageState parent;
  //LoginProgressButton(this.parent);
  @override
  _LoginProgressButtonState createState() => _LoginProgressButtonState();
}

class _LoginProgressButtonState extends State<LoginProgressButton> {
  var _buttonState = ButtonState.normal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ProgressButton(
        child: Text(
          'Enroll',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () async {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }

          if (selfEnrollPayload.length > 0) {
            if (await UtilityFunctions.checkConnection()) {
              try {
                List<ListOnboardingRequest> payload = new List();
                selfEnrollPayload.forEach((key, value) async {
                  payload.add(value);
                });

                setState(() {
                  _buttonState = ButtonState.inProgress;
                });

                for (ListOnboardingRequest value in payload) {
                  await ApiController.sendRequestForPortalListOnboarding(
                      listOnBoardingID: value.ListOnBoardingID,
                      isChecked: value.IsChecked,
                      method: "POST",
                      membershipCharge: value.MembershipCharge);
                }

                setState(() {
                  _buttonState = ButtonState.normal;
                  SweetAlert.show(context,
                      title: "Successful",
                      subtitle: selfEnrollPayload.length > 1
                          ? "Your enrollment options were saved successfully"
                          : "Your enrollment option was saved successfully",
                      style: SweetAlertStyle.success);
                });
              } catch (ex) {
                setState(() {
                  _buttonState = ButtonState.error;
                  SweetAlert.show(context,
                      title: "Unsuccessful",
                      subtitle: ex.toString(),
                      style: SweetAlertStyle.error);
                });
              }
            } else {
              setState(() {
                _buttonState = ButtonState.error;
                Fluttertoast.showToast(
                    msg: "Ooops, check your internet connection.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 14.0);
              });
            }
          } else {
            setState(() {
              _buttonState = ButtonState.error;
              Fluttertoast.showToast(
                  msg: "No option selected for enrollment.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.amber,
                  textColor: Colors.white,
                  fontSize: 14.0);
            });
          }
        },
        buttonState: _buttonState,
        myColor: true,
        backgroundColor: Colors.amber,
        progressColor: Colors.white,
      ),
    );
  }
}

class SelfEnrollItemWidget extends StatefulWidget {
  final PortalListOnboardingResponseModel response;
  SelfEnrollItemWidget(this.response);

  @override
  _SelfEnrollItemWidgetState createState() => _SelfEnrollItemWidgetState();
}

class _SelfEnrollItemWidgetState extends State<SelfEnrollItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            if (widget.response.IsChecked == "true")
              widget.response.IsChecked = "false";
            else
              widget.response.IsChecked = "true";

            ListOnboardingRequest requestPayload = new ListOnboardingRequest(
                "",
                widget.response.ID,
                widget.response.IsChecked,
                "",
                "POST",
                widget.response.AmountCharged);

//selfEnrollPayload.putIfAbsent(requestPayload.ListOnBoardingID, () => requestPayload);
            selfEnrollPayload.update(
                requestPayload.ListOnBoardingID, (value) => requestPayload,
                ifAbsent: () => requestPayload);

            // if (selfEnrollPayload.length <= 0) {
            //   selfEnrollPayload.add(requestPayload);
            // } else {
            //   for (int i = 0; i < selfEnrollPayload.length; i++) {
            //     ListOnboardingRequest obj = selfEnrollPayload[i];
            //     if (obj.ListOnBoardingID == widget.response.ID &&
            //         obj.IsChecked == widget.response.IsChecked) {
            //       break;
            //     } else if (i == (selfEnrollPayload.length - 1)) {
            //       if (obj.ListOnBoardingID != widget.response.ID &&
            //           obj.IsChecked != widget.response.IsChecked) {
            //         selfEnrollPayload.add(requestPayload);

            //       } else if (obj.ListOnBoardingID == widget.response.ID &&
            //           obj.IsChecked != widget.response.IsChecked) {
            //         if (obj.IsChecked == "true")
            //           obj.IsChecked = "false";
            //         else
            //           obj.IsChecked = "true";

            //       } else {}
            //     }
            //}
            // }
          });
        },
        child: Card(
          elevation: 5,
          child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      widget.response.IsChecked == "true"
                          ? Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                  'assets/images/member_app_assets/tick.png'),
                            )
                          : Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                  'assets/images/member_app_assets/green_circle.png'),
                            ),
                      Expanded(
                        child: Text(
                          'Enroll: ${widget.response.Title}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  _rowItem(
                      leftLabel: "Enrollment End Date",
                      rightLabel: widget.response.ExpiryDate),
                  SizedBox(
                    height: 5,
                  ),
                  _rowItem(
                      leftLabel: "Membership Charge",
                      rightLabel: widget.response.AmountCharged),
                  SizedBox(height: 5),
                  Text(
                    'Description',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(widget.response.Description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13.0, color: Colors.grey))
                ],
              )),
        ),
      ),
    );
  }

  Widget _rowItem(
      {String leftLabel = '',
      String centerLabel = ':',
      String rightLabel,
      bool header = false,
      bool divider = false,
      String receiptOrInvoice}) {
    //RECEIPT = 2 OR INVOICE = 0
    bool isReceiptOrInvoice =
        receiptOrInvoice == '2' ? true : receiptOrInvoice == '0' ? false : true;

    Widget returnWidget = divider
        ? Divider(
            color: Colors.black,
            height: 2.0,
          )
        : header
            ? Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Text(
                        leftLabel,
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // width: 200.0,
                        child: Text(
                          rightLabel,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.black),
                        ),
                        padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: isReceiptOrInvoice
                                ? Colors.green
                                : Colors.orange),
                      ),
                    )
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      leftLabel,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    // Text(
                    //   centerLabel,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(fontSize: 13.0, color: Colors.black87),
                    // ),
                    Text(
                      rightLabel,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13.0, color: Colors.grey),
                    )
                  ],
                ));

    return returnWidget;
  }
}
