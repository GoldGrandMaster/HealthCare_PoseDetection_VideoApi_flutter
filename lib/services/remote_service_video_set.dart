import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/video_set_post.dart';

class RemoteService_set {
  Future<PostSet?> getPostsSet(var videoID) async {
    var client = http.Client();
    var s = videoID.toString();
    // print('******************************videoID:${s}');
    var uri = Uri.parse(
        'http://mirror.ccjjj.com/xcxapi/teacher/video_set?uid=777&video_id=$s');
    var response = await client.post(uri);

    if (response.statusCode == 200) {
      print(
          '------------------------success_post_api_video_set---------------------------');
      var str = response.body;
      PostSet res = postFromJson(str);
      return res;
    } else {
      print(
          '------------------------failed_post_api_video_set---------------------------');
      return null; // or an empty list: return [];
    }
  }
}
