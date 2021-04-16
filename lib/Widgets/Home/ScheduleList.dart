import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyto_professor/Constants/TytoColors.dart';
import 'package:tyto_professor/Providers/TodaysScheduleList.dart';

class ScheduleList extends StatefulWidget {
  static _showRoomID({BuildContext context, String message, Color backgroundColor, Color textColor}) {
    showToastWidget(
      Container(
        padding: EdgeInsets.all(
          20.0,
        ),
        margin: EdgeInsets.all(
          20.0,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        child: Text(
          message,
          style: GoogleFonts.raleway(
            color: TytoColors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      context: context,
      animation: StyledToastAnimation.slideFromBottomFade,
      animDuration: Duration(
        milliseconds: 100,
      ),
      position: StyledToastPosition(
        align: Alignment.bottomCenter,
      ),
    );
  }

  @override
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  var _crossAxisCount = 3;

  void _getCrossAxisCount({BuildContext context}) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    if (_screenWidth < 1100 || _screenHeight < 1400) {
      setState(() {
        _crossAxisCount = 2;
      });
    } else if (_screenWidth < 1000 || _screenHeight < 1000) {
      setState(() {
        _crossAxisCount = 1;
      });
    } else {
      setState(() {
        _crossAxisCount = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => TodaysScheduleList.isFetchingData.value
          ? Expanded(
              child: Center(
                child: SizedBox(
                  height: 150.0,
                  width: 150.0,
                  child: Column(
                    children: [
                      SpinKitFadingCube(
                        color: TytoColors.darkMintGreen,
                        size: 55.0,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        'Loading...',
                        style: GoogleFonts.raleway(
                          color: TytoColors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Expanded(
              child: Obx(
                () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 2,
                    crossAxisCount: _screenWidth < 1000
                        ? 1
                        : _screenWidth < 1400
                            ? 2
                            : 3,
                    crossAxisSpacing: 40.0,
                    mainAxisSpacing: 40.0,
                  ),
                  padding: const EdgeInsets.all(
                    20.0,
                  ),
                  itemCount: TodaysScheduleList.todaysSchedules.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: TytoColors.lightBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Spacer(),
                            Center(
                              child: Text(
                                'SECTION ' + TodaysScheduleList.todaysSchedules[index].section.toString(),
                                style: GoogleFonts.raleway(
                                  color: TytoColors.white,
                                  fontSize: _screenWidth < 480 ? 10.0 : 20.0,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.transparent,
                            ),
                            Center(
                              child: Text(
                                TodaysScheduleList.todaysSchedules[index].time.toString(),
                                style: GoogleFonts.raleway(
                                  color: TytoColors.white,
                                  fontSize: _screenWidth < 480 ? 30.0 : 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: TytoColors.darkMintGreen,
                              ),
                              onPressed: () {
                                ScheduleList._showRoomID(
                                  context: context,
                                  backgroundColor: TytoColors.darkMintGreen,
                                  message: 'RoomID: ' + TodaysScheduleList.todaysSchedules[index].roomID.toString(),
                                  textColor: TytoColors.white,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                ),
                                child: Text(
                                  'ENTER ROOM',
                                  style: GoogleFonts.raleway(
                                    color: TytoColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
