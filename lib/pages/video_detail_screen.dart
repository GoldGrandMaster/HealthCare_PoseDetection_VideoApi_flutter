import 'package:flutter/material.dart';
import '../models/video_detail_post.dart';
import '../services/remote_service_video_detail.dart';

class VideoDetailScreen extends StatefulWidget {
  final int videoId;

  const VideoDetailScreen({Key? key, required this.videoId}) : super(key: key);
  @override
  _VideoDetailScreenState createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  // List<Post>? posts;
  Post? posts;
  var isLoaded = false;
  var videoId;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      videoId = widget.videoId;
      print("Received videoId: $videoId"); // Add this line to debug
      // Fetch data using the videoId
      getData();
    });
  }

  getData() async {
    print('Fetching Data...');
    print("Video ID: $videoId");

    posts = await RemoteService().getPosts(videoId);

    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post: Video_details'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          // itemCount: posts?.result.length,
          itemCount: 1,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts!.result.data.actionInfo.id.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          posts!.result.data.actionInfo.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          posts!.result.data.actionInfo.actionId,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
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
    );
  }
}
