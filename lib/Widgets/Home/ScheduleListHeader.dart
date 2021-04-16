import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tyto_professor/Constants/TytoColors.dart';

class ScheduleListHeader extends StatefulWidget {
  @override
  _ScheduleListHeaderState createState() => _ScheduleListHeaderState();
}

class _ScheduleListHeaderState extends State<ScheduleListHeader> {
  String date = '';
  @override
  void initState() {
    super.initState();
    DateTime rawDateData = DateTime.now();
    var formatter = DateFormat('MMM d, y');
    var formattedDate = formatter.format(rawDateData);
    setState(() {
      date = formattedDate;
    });
    print(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.02, vertical: _screenHeight * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'TODAY\'S CLASS SCHEDULE\n',
                  style: GoogleFonts.raleway(
                    color: TytoColors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' \nDate: $date',
                  style: GoogleFonts.raleway(
                    color: TytoColors.white,
                    fontSize: 15.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
