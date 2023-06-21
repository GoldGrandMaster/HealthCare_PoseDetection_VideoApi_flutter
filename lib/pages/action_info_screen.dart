import 'package:flutter/material.dart';
import '../models/action_info_post.dart';
import '../models/video_set_post.dart';
import '../services/remote_service_action_info.dart';
import '../services/remote_service_video_set.dart';

class ActionInfoScreen extends StatefulWidget {
  final int videoId;

  const ActionInfoScreen({Key? key, required this.videoId}) : super(key: key);
  @override
  _ActionInfoScreenState createState() => _ActionInfoScreenState();
}

class _ActionInfoScreenState extends State<ActionInfoScreen> {
  PostDetail? posts;
  PostSet? pposts;
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

    pposts = await RemoteService_set().getPostsSet(videoId);
    int action_id = pposts!.result[0].actionId;
    posts = await RemoteService_detail().getPostsdetail(action_id);
    if (posts != null && pposts != null) {
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
                      'Video_id: ' + videoId.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        '**********************video_set************************'),
                    Text(
                      // 'start_time: ' + pposts!.result[0].startTime,
                      'start_time: ' +
                          (pposts != null && pposts!.result.isNotEmpty
                              ? pposts!.result[0].startTime
                              : 'N/A'),
                    ),
                    Text(
                      'end_time: ' +
                          (pposts != null && pposts!.result.isNotEmpty
                              ? pposts!.result[0].endTime
                              : 'N/A'),
                    ),
                    Text(
                      'action_id: ' +
                          (pposts != null && pposts!.result.isNotEmpty
                              ? pposts!.result[0].actionId.toString()
                              : 'N/A'),
                    ),
                    Text(
                      'id: ' +
                          (pposts != null && pposts!.result.isNotEmpty
                              ? pposts!.result[0].id.toString()
                              : 'N/A'),
                    ),
                    Text(
                      'title: ' +
                          (pposts != null && pposts!.result.isNotEmpty
                              ? pposts!.result[0].title
                              : 'N/A'),
                    ),
                    Text(
                        '\n**********************action_info**********************'),
                    Text(
                      'id: ${posts != null ? posts!.result.data.actionInfo.id.toString() : 'N/A'}',
                    ),
                    Text(
                      'title: ${posts != null ? posts!.result.data.actionInfo.title : 'N/A'}',
                    ),
                    Text(
                      'Stage1: angle1: ${posts != null && posts!.result.data.stage1.isNotEmpty ? posts!.result.data.stage1[0].angle1 : 'N/A'} angle2: ${posts != null && posts!.result.data.stage1.isNotEmpty ? posts!.result.data.stage1[0].angle2 : 'N/A'}',
                    ),
                    Text(
                      'Stage2: angle1: ${posts != null && posts!.result.data.stage2.isNotEmpty ? posts!.result.data.stage2[0].angle1 : 'N/A'} angle2: ${posts != null && posts!.result.data.stage2.isNotEmpty ? posts!.result.data.stage2[0].angle2 : 'N/A'}',
                    ),
                    // Text('t_title: ' + posts!.result.data.actionInfo.tTitle),
                    // Text(
                    //   'action_id: ' + posts!.result.data.actionInfo.actionId,
                    // ),
                  ],
                ),
              ),
              // SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Play', arguments: 0);
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
