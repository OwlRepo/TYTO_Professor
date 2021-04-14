import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyto_professor/Models/PerDayScheduleDataModel.dart';

class TodaysScheduleList extends GetxController {
  static var _fbInstance = FirebaseFirestore.instance.collection('Schedules').doc('Professor');
  static RxList<dynamic> todaysSchedules = [].obs;
  static RxBool isFetchingData = false.obs;

  static Future<void> fetchData({@required String accountID, @required currentDay}) async {
    //set isFetchingData to true to display the circular progress indicator first
    isFetchingData.value = !isFetchingData.value;
    //connect to db
    await _fbInstance.collection(accountID).doc(currentDay).get().then((value) {
      //initialize a list that will catch all the incoming data
      List<PerDayScheduleDataModel> dataCatcher = [];
      //For loop to filter out the empty indexes in List of "time" in JSON
      //Filtering was done to set the right length of data in GridView
      for (int index = 0; index < value.data()['time'].length; index++) {
        //if the index in list of "time" is not an empty string then add it to dataCatcher list
        if (value.data()['time'][index] != '') {
          dataCatcher.add(
            PerDayScheduleDataModel(
              roomID: value.data()['roomID'][index],
              section: value.data()['section'][index],
              time: value.data()['time'][index],
            ),
          );
        } else {
          print('Unhandled Event.');
        }
      }
      //Once For Loop is done, set the observable value of "todaysSchedules" equal to "dataCatcher"
      todaysSchedules.value = dataCatcher;
    }).then((_) => isFetchingData.value = !isFetchingData.value);
  }
}
