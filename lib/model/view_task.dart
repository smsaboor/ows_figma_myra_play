// To parse this JSON data, do
//
//     final viewTask = viewTaskFromJson(jsonString);

import 'dart:convert';

List<Data> dataFromJson(String str) => List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));
// ViewTask viewTaskFromJson(String str) => ViewTask.fromJson(json.decode(str));

ViewTask viewTaskFromJson(String str) => ViewTask.fromJson(json.decode(str));
String viewTaskToJson(ViewTask data) => json.encode(data.toJson());

class ViewTask {
  ViewTask({
    this.status,
    this.data,
  });

  bool? status;
  List<Data>? data;

  factory ViewTask.fromJson(Map<String, dynamic> json) => ViewTask(
    status: json["status"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.id,
    this.date,
    this.videoTitle,
    this.video,
    this.videoDuration,
    this.taskEndDate,
    this.userId,
    this.taskStatus,
  });

  String? id;
  DateTime? date;
  String? videoTitle;
  String? video;
  String? videoDuration;
  DateTime? taskEndDate;
  String? userId;
  String? taskStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    videoTitle: json["video_title"],
    video: json["video"],
    videoDuration: json["video_duration"],
    taskEndDate: DateTime.parse(json["task_end_date"]),
    userId: json["user_id"],
    taskStatus: json["task_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "video_title": videoTitle,
    "video": video,
    "video_duration": videoDuration,
    "task_end_date": "${taskEndDate!.year.toString().padLeft(4, '0')}-${taskEndDate!.month.toString().padLeft(2, '0')}-${taskEndDate!.day.toString().padLeft(2, '0')}",
    "user_id": userId,
    "task_status": taskStatus,
  };
}
