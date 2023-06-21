import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/action_info_post.dart';

class RemoteService_detail {
  Future<PostDetail?> getPostsdetail(var actionID) async {
    var client = http.Client();
    var s = actionID.toString();
    var uri = Uri.parse(
        'http://mirror.ccjjj.com/xcxapi/teacher/action_info?uid=777&action_id=$s');
    var response = await client.post(uri);

    if (response.statusCode == 200) {
      print(
          '------------------------success_post_api_detail---------------------------');
      var str = response.body;
      PostDetail res = postFromJson(str);
      return res;
    } else {
      print(
          '------------------------failed_post_api_detail---------------------------');
      return null; // or an empty list: return [];
    }
  }
}
