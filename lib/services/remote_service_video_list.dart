import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/video_list_post.dart';

class RemoteService {
  // Future<List<Post>?> getPosts() async {
  Future<Post?> getPosts() async {
    var client = http.Client();

    var uri =
        Uri.parse('http://mirror.ccjjj.com/xcxapi/teacher/video_list?uid=777');
    var response = await client.post(uri);

    if (response.statusCode == 200) {
      print(
          '------------------------success_post_api_list---------------------------');
      var str = response.body;
      Post res = postFromJson(str);
      return res;
    } else {
      print(
          '------------------------failed_post_api_list---------------------------');
      return null; // or an empty list: return [];
    }
  }
}
