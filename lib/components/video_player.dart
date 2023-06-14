// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerCustum extends StatefulWidget {
//   const VideoPlayerCustum({Key key}) : super(key: key);

//   @override
//   State<VideoPlayerCustum> createState() => _VideoPlayerCustumState();
// }

// class _VideoPlayerCustumState extends State<VideoPlayerCustum> {
//   VideoPlayercontroller _conroller;
//   Future<void> _video;

//   @override
//   void initState() {
//     super.initState();
//     _conroller = VideoPlayerController.network(
//         "https://video.bodybt.com/a077f3f3ee9b4331b26e6a92c20e1535/8080108b9878caa51250b0567d4bc14b-sd.m3u8");
//     _video = _conroller.initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _video,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayerCustum(_controller),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (_conroller.value.isPlaying) {
//             setState(() {
//               _conroller.pause();
//             });
//           } else {
//             setState(() {
//               _conroller.play();
//             });
//           }
//         },
//         child:
//             Icon(_conroller.value.isPlaying ? Icons.pause : Icons.play_arrow),
//       ),
//     );
//   }
// }
