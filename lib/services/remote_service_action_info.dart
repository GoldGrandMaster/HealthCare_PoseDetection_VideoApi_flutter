import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/action_info_post.dart';

int start_angle = 0, end_angle = 0;
int varience = 0, fail_time = 0;
int angleGt = 0;
String angleGtMsg = '', failMsg = '';

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
      start_angle = int.parse(res.result.data.stage2[0].angle1);
      end_angle = int.parse(res.result.data.stage2[0].angle2);
      varience = int.parse(res.result.data.stage2[0].variance);
      fail_time = int.parse(res.result.data.stage2[0].failTime);
      angleGt = int.parse(res.result.data.stage2[0].angleGt);
      angleGtMsg = res.result.data.stage2[0].angleGtMsg;

      return res;
    } else {
      print(
          '------------------------failed_post_api_detail---------------------------');
      return null; // or an empty list: return [];
    }
  }
}
