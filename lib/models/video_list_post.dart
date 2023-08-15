// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

PostList postFromJson(String str) => PostList.fromJson(json.decode(str));

String postToJson(PostList data) => json.encode(data.toJson());

class PostList {
  int code;
  String msg;
  List<Result> result;

  PostList({
    required this.code,
    required this.msg,
    required this.result,
  });

  factory PostList.fromJson(Map<String, dynamic> json) {
    // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!api!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    // var rlt = json["result"];
    // print(rlt);
    return PostList(
      code: json["code"],
      msg: json["msg"],
      result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  int videoId;
  String title;
  String tTitle;
  String summary;
  String tSummary;
  String linkurl;
  String enLinkurl;
  String thumb;
  String enThumb;
  String time;
  int lvl;
  TeacherName? teacherName;
  TeacherName? teacherTName;
  TeacherEnName? teacherEnName;
  String device;
  dynamic showPower;
  String teacher;
  String image;
  String enImage;

  Result({
    required this.videoId,
    required this.title,
    required this.tTitle,
    required this.summary,
    required this.tSummary,
    required this.linkurl,
    required this.enLinkurl,
    required this.thumb,
    required this.enThumb,
    required this.time,
    required this.lvl,
    this.teacherName,
    this.teacherTName,
    this.teacherEnName,
    required this.device,
    this.showPower,
    required this.teacher,
    required this.image,
    required this.enImage,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    // print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
    // print(json["video_id"]);
    // print(json["title"]);
    return Result(
      videoId: json["video_id"],
      title: json["title"],
      tTitle: json["t_title"],
      summary: json["summary"],
      tSummary: json["t_summary"],
      linkurl: json["linkurl"],
      enLinkurl: json["en_linkurl"],
      thumb: json["thumb"],
      enThumb: json["en_thumb"],
      time: json["time"],
      lvl: json["lvl"],
      teacherName: teacherNameValues.map[json["teacher_name"]],
      teacherTName: teacherNameValues.map[json["teacher_t_name"]],
      teacherEnName: teacherEnNameValues.map[json["teacher_en_name"]],
      device: json["device"],
      showPower: json["show_power"],
      teacher: json["teacher"],
      image: json["image"],
      enImage: json["en_image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "video_id": videoId,
        "title": title,
        "t_title": tTitle,
        "summary": summary,
        "t_summary": tSummary,
        "linkurl": linkurl,
        "en_linkurl": enLinkurl,
        "thumb": thumb,
        "en_thumb": enThumb,
        "time": time,
        "lvl": lvl,
        "teacher_name": teacherNameValues.reverse[teacherName],
        "teacher_t_name": teacherNameValues.reverse[teacherTName],
        "teacher_en_name": teacherEnNameValues.reverse[teacherEnName],
        "device": device,
        "show_power": showPower,
        "teacher": teacher,
        "image": image,
        "en_image": enImage,
      };
}

enum TeacherEnName { HULK }

final teacherEnNameValues = EnumValues({"Hulk": TeacherEnName.HULK});

enum TeacherName { EMPTY }

final teacherNameValues = EnumValues({"浩克": TeacherName.EMPTY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  // EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
