import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/video_detail_post.dart';

class RemoteService {
  // Future<List<Post>?> getPosts() async {
  Future<Post?> getPosts(var videoID) async {
    var client = http.Client();
    var s = videoID.toString();
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print('******************************${videoID}');
    var uri = Uri.parse(
        'http://mirror.ccjjj.com/xcxapi/teacher/action_info?uid=777&action_id=$s');
    var response = await client.post(uri);

    if (response.statusCode == 200) {
      print(
          '------------------------success_post_api_detail---------------------------');
      var str = response.body;
      Post res = postFromJson(str);
      int start_angle = int.parse(res.result.data.stage1[0].angle1);
      print('***************************${start_angle}');
      return res;
    } else {
      print(
          '------------------------failed_post_api_detail---------------------------');
      return null; // or an empty list: return [];
    }
  }
}
