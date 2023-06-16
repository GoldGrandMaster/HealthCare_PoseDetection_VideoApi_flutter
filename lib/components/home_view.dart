import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/home_controller.dart';
import '../pages/camera_screen.dart';
import 'camera_view.dart';
import 'package:chewie/chewie.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      // margin: EdgeInsets.only(bottom: 20, right: 10, top: 20),
      height: MediaQuery.of(context).size.height * 0.7,
      // width: MediaQuery.of(context).size.width,

      child: Row(
        children: [
          Flexible(
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.7,
              // padding: const EdgeInsets.all(16),
              // width: 100,
              height: 500,
              child: Chewie(controller: chewieController),
            ),
          ),
          Flexible(
            child: Container(
              // width: 100,
              height: 500,
              // height: MediaQuery.of(context).size.height * 0.7,
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
          ),
        ],
      ),
    );
  }
}
