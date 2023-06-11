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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post: Video_details'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'id: ' + posts!.result.data.actionInfo.id.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'title: ' + posts!.result.data.actionInfo.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'action_id: ' + posts!.result.data.actionInfo.actionId,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/camera', arguments: 0);
                    // Navigator.of(context).pushNamed('/video_detail',
                    //             arguments: videoId);
                  },
                  child: Center(
                    child: Container(
                      height: 46,
                      width: width - 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        gradient: LinearGradient(
                          begin: Alignment(-1.0, 0),
                          end: Alignment(1.0, 0),
                          colors: [
                            Theme.of(context).secondaryHeaderColor,
                            Theme.of(context)
                                .secondaryHeaderColor
                                .withAlpha(155)
                          ],
                          stops: [0.0, 1.0],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).primaryColor.withOpacity(1),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Play',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 25,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
