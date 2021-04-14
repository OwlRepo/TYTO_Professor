import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyto_professor/Constants/TytoColors.dart';
import 'package:tyto_professor/Providers/TodaysScheduleList.dart';
import 'package:tyto_professor/Widgets/Home/Header.dart';
import 'package:tyto_professor/Widgets/Home/ScheduleListHeader.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _fetchSchedList() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();

    DateTime rawDateData = DateTime.now();
    var formatter = DateFormat('EEEE');
    var formattedDate = formatter.format(rawDateData); //name of day e.g Monday

    TodaysScheduleList.fetchData(
      accountID: _sharedPreferences.getString('loggedInAccountID'),
      currentDay: 'Monday',
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchSchedList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: TytoColors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            ScheduleListHeader(),
            Obx(
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
                            crossAxisCount: 3,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                          ),
                          itemCount: TodaysScheduleList.todaysSchedules.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                TodaysScheduleList.todaysSchedules[index].time.toString(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
