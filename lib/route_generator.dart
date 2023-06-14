import 'package:flutter/material.dart';
import '/pages/login_screen.dart';
import '/pages/splash_screen.dart';
import '/pages/video_list_screen.dart';
import '/pages/video_detail_screen.dart';
import '/pages/camera_screen.dart';
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
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Builder(
              builder: (context) => Stack(
                children: [
                  VideoPlayerScreen(),
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: MediaQuery.of(context).size.width * 0.5,
                    child: CameraScreen(),
                  ),
                ],
              ),
            ),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
