import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../helpers/home_controller.dart';
// import '../pages/camera_screen.dart';
import '../pages/video_list_screen.dart';
import 'camera_view.dart';
import 'package:chewie/chewie.dart';

late ChewieController chewieController;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoPlayerController = VideoPlayerController.network(video_linkurl);

    @override
    void initState() {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 9 / 16,
        autoPlay: true,
        looping: false,
      );
    }

    initState();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Action: Let\'s go!'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                // flex: 1,
                child: Container(
                  height: 500,
                  margin: EdgeInsets.only(right: 5),
                  child: Chewie(controller: chewieController),
                ),
              ),
              Expanded(
                // flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  height: 500,
                  child: GetBuilder<HomeController>(builder: (context) {
                    return CameraView(
                      title: 'Pose Detector',
                      customPaint: controller.customPaint,
                      onImage: (inputImage) {
                        controller.processImage(inputImage);
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // return Container(
    //   padding: const EdgeInsets.all(16),
    //   // margin: EdgeInsets.only(bottom: 20, right: 10, top: 20),
    //   // height: MediaQuery.of(context).size.height,
    //   // width: MediaQuery.of(context).size.width,
    //   child: Row(
    //     children: [
    //       Flexible(
    //         child: Container(
    //           height: 500,
    //           child: Chewie(controller: chewieController),
    //         ),
    //       ),
    //       Flexible(
    //         child: Container(
    //           height: 500,
    //           child: GetBuilder<HomeController>(builder: (context) {
    //             return CameraView(
    //               title: 'Pose Detector',
    //               customPaint: controller.customPaint,
    //               onImage: (inputImage) {
    //                 controller.processImage(inputImage);
    //               },
    //             );
    //           }),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
