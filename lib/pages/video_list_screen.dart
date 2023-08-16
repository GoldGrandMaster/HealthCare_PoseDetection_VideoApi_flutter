import 'package:flutter/material.dart';
import '../models/video_list_post.dart';
import '../services/remote_service_video_list.dart';

var ID;
var video_linkurl;

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<VideoListScreen> {
  PostList? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService_list().getPostslist();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post: Video_lists'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Visibility(
            visible: isLoaded,
            child: ListView.builder(
              itemCount: posts?.result.length,
              // itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[300],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            ID = posts!.result[index].videoId;
                            print("Pushing video detail with ID: $ID");
                            video_linkurl = posts!.result[index].linkurl;
                            print('video_URL: ' + video_linkurl);
                            Navigator.of(context)
                                .pushNamed('/video_detail', arguments: ID);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // posts![index].code.toString(),
                                "Video_Id: " +
                                    posts!.result[index].videoId.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                // posts![index].msg ?? '',
                                "Titile: " + posts!.result[index].title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
