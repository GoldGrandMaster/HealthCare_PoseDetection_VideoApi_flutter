import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
// import 'package:flutter/services.dart';
import '../helpers/home_setup.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraScreen> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    initApp();
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
