import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import './app.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalConfiguration().loadFromAsset("configurations");

  // await CameraService.instance.initCameras();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => App(),
    ),
  );
}
