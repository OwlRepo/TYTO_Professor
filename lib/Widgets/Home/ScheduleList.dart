import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyto_professor/Constants/TytoColors.dart';
import 'package:tyto_professor/Providers/TodaysScheduleList.dart';

class ScheduleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
