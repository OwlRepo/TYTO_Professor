import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyto_professor/Constants/TytoColors.dart';
import 'package:tyto_professor/Providers/TodaysScheduleList.dart';
import 'package:tyto_professor/Routes/NotSupported.dart';
import 'package:tyto_professor/Widgets/Home/Header.dart';
import 'package:tyto_professor/Widgets/Home/ScheduleList.dart';
import 'package:tyto_professor/Widgets/Home/ScheduleListHeader.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _fetchSchedList() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

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
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _screenWidth < 250 && _screenHeight < 650
          ? NotSupported()
          : Container(
              height: _screenHeight,
              width: _screenWidth,
              decoration: BoxDecoration(
                color: TytoColors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  ScheduleListHeader(),
                  ScheduleList(),
                ],
              ),
            ),
    );
  }
}
