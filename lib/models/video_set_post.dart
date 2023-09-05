// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

PostSet postFromJson(String str) => PostSet.fromJson(json.decode(str));

String postToJson(PostSet data) => json.encode(data.toJson());

class PostSet {
  int code;
  String msg;
  List<Result> result;

  PostSet({
    required this.code,
    required this.msg,
    required this.result,
  });

  factory PostSet.fromJson(Map<String, dynamic> json) => PostSet(
        code: json["code"],
        msg: json["msg"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  String startTime;
  String endTime;
  int actionId;
  int id;
  String title;

  Result({
    required this.startTime,
    required this.endTime,
    required this.actionId,
    required this.id,
    required this.title,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        startTime: json["start_time"],
        endTime: json["end_time"],
        actionId: json["action_id"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
        "action_id": actionId,
        "id": id,
        "title": title,
      };
}
