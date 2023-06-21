import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/video_set_post.dart';

int video_start_Time = 0, video_end_Time = 0;

int Int(String str) {
  return int.parse(str);
}

class RemoteService_set {
  Future<PostSet?> getPostsSet(var videoID) async {
    var client = http.Client();
    var s = videoID.toString();
    // print('******************************videoID:${s}');
    var uri = Uri.parse(
        'http://mirror.ccjjj.com/xcxapi/teacher/video_set?uid=777&video_id=$s');
    var response = await client.post(uri);

    if (response.statusCode == 200) {
      var str = response.body;
      PostSet res = postFromJson(str);

      List<String> timeParts;
      String startTime = res.result[0].startTime;
      timeParts = startTime.split(':');
      video_start_Time =
          Int(timeParts[0]) * 3600 + Int(timeParts[1]) * 60 + Int(timeParts[2]);

      String endTime = res.result[0].endTime;
      timeParts = endTime.split(':');
      video_end_Time =
          Int(timeParts[0]) * 3600 + Int(timeParts[1]) * 60 + Int(timeParts[2]);

      print(
          '------------------------success_post_api_video_set---------------------------');

      return res;
    } else {
      print(
          '------------------------failed_post_api_video_set---------------------------');
      return null; // or an empty list: return [];
    }
  }
}
