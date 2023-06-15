import 'package:flutter/material.dart';
import '/pages/login_screen.dart';
import '/pages/splash_screen.dart';
import '/pages/video_list_screen.dart';
import '/pages/video_detail_screen.dart';
import '/pages/camera_screen.dart';
import 'components/home_view.dart';
import 'pages/video_player_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/video_list':
        return MaterialPageRoute(builder: (_) => VideoListScreen());
      case '/video_detail':
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) => VideoDetailScreen(videoId: args));
        }
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: SafeArea(
                    child: Text(
                        'Error in video_detail route: args is not String'))));
      case '/Play':
        // return MaterialPageRoute(builder: (_) => CameraScreen());
        return MaterialPageRoute(builder: (_) => VideoPlayerScreen());
      // return MaterialPageRoute(
      //   builder: (_) => Scaffold(
      //     body: Builder(
      //       builder: (context) => Row(
      //         children: [
      //           Expanded(
      //             child: CameraScreen(),
      //           ),
      //           Expanded(
      //             child: VideoPlayerScreen(),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // );
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
