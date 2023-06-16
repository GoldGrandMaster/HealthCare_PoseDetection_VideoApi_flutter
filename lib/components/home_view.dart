import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/home_controller.dart';
import '../pages/camera_screen.dart';
import 'camera_view.dart';
import 'package:chewie/chewie.dart';

// final double progressBarPercent = 0.7;
// final Color progressBarColor = Colors.red;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      // margin: EdgeInsets.only(bottom: 20, right: 10, top: 20),
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              // padding: const EdgeInsets.all(16),
              // width: 100,
              height: 500,
              child: Chewie(controller: chewieController),
            ),
          ),
          Expanded(
            // child: Align(
            // alignment: Alignment.centerRight,
            // child: ClipRRect(
            //   borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              // width: 100,
              height: 500,
              // decoration: BoxDecoration(
              //   border: Border.all(width: 10, color: Colors.green),
              // ),
              // margin: EdgeInsets.only(bottom: 30),
              child: GetBuilder<HomeController>(builder: (context) {
                return CameraView(
                  title: 'Pose Detector',
                  customPaint: controller.customPaint,
                  // text: controller.text,
                  onImage: (inputImage) {
                    controller.processImage(inputImage);
                  },
                );
              }),
            ),
            // ),
            // ),
          ),
        ],
      ),
    );
  }
}
