import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import '../pages/camera_screen.dart';

class CameraView extends StatefulWidget {
  CameraView({
    Key? key,
    required this.title,
    required this.customPaint,
    // this.text,
    required this.onImage,
    this.initialDirection = CameraLensDirection.back,
  }) : super(key: key);

  final String title;
  final CustomPaint? customPaint;
  // final String? text;
  final Function(InputImage inputImage) onImage;
  final CameraLensDirection initialDirection;

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _controller;
  final int _cameraIndex = 0;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;

  @override
  void initState() {
    _startLiveFeed();
    super.initState();
  }

  @override
  void dispose() {
    _stopLiveFeed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _liveFeedBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _liveFeedBody() {
    // if (_controller?.value.isInitialized == false) {
    //   return Container();
    // }

    if (_controller == null || !_controller!.value.isInitialized) {
      return Container();
    }

    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * _controller!.value.aspectRatio;
    if (scale < 1) scale = 1 / scale;

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Transform.scale(
            scale: scale,
            child: Center(
              child: CameraPreview(_controller!),
            ),
          ),
          if (widget.customPaint != null) widget.customPaint!,
        ],
      ),
      // child: Stack(
      //   fit: StackFit.expand,
      //   children: <Widget>[
      //     Align(
      //       alignment: Alignment.centerRight,
      //       child: ClipRRect(
      //         borderRadius: BorderRadius.all(Radius.circular(20)),
      //         child: Container(
      //           width: 220,
      //           height: 500,
      //           decoration: BoxDecoration(
      //             border: Border.all(width: 10, color: Colors.green),
      //           ),
      //           // margin: EdgeInsets.only(bottom: 30),
      //           child: CameraPreview(_controller!),
      //           // child: Square(),
      //         ),
      //       ),
      //     ),
      //     if (widget.customPaint != null) widget.customPaint!,
      //   ],
      // ),
    );
  }

  

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage =
        InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    widget.onImage(inputImage);
  }
}
