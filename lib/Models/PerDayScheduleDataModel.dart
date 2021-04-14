class PerDayScheduleDataModel {
  String roomID;
  String section;
  String time;

  PerDayScheduleDataModel({this.roomID, this.section, this.time});

  // PerDayScheduleDataModel.fromJson(Map<String, dynamic> json) {
  //   roomID = json['roomID'].cast<String>();
  //   section = json['section'].cast<String>();
  //   time = json['time'].cast<String>();
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['roomID'] = this.roomID;
  //   data['section'] = this.section;
  //   data['time'] = this.time;
  //   return data;
  // }
}
