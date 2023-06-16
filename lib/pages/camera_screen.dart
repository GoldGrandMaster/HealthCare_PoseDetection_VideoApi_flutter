import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import '../helpers/home_setup.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'video_list_screen.dart';

List<CameraDescription> cameras = [];

late ChewieController chewieController;

class CameraScreen extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraScreen> {
  final videoPlayerController = VideoPlayerController.network(linkurl);
  // final videoPlayerController = VideoPlayerController.network(
  //     'https://video.bodybt.com/a077f3f3ee9b4331b26e6a92c20e1535/8080108b9878caa51250b0567d4bc14b-sd.m3u8');

  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 9 / 16,
      autoPlay: true,
      looping: false,
    );
    initApp();
    super.initState();
  }

  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    runApp(
      GetMaterialApp(
        title: "Application",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomeSetup.initialRoute,
        getPages: HomeSetup.routes,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // return an empty container as this widget's job is to initialize your app.
  }
}
