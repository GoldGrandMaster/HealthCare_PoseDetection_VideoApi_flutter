import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import './app.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalConfiguration().loadFromAsset("configurations");
  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => App(),
    ),
  );
}


// import 'package:flutter/material.dart';
// import 'package:video_list/pages/splash_screen.dart';
// import '../pages/login_screen.dart';
// import '../pages/video_list_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Digital Healthcare',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: VideoListScreen(),
//     );
//   }
// }
