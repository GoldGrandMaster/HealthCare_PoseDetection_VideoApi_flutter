import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadData() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/Login', arguments: 0);
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   final width = MediaQuery.of(context).size.width;
  //   final height = MediaQuery.of(context).size.height;
  //   return Scaffold(
  //     body: Stack(
  //       alignment: AlignmentDirectional.topCenter,
  //       children: [
  //         Positioned(
  //           width: width,
  //           top: height / 3,
  //           // child: Container(
  //           child: Center(
  //             child: Container(
  //               child: Text(
  //                 "体能训练",
  //                 style: TextStyle(
  //                   color: Color(0xff3c8758),
  //                   fontSize: 40,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           // ),
  //         ),
  //         Positioned(
  //           width: width - 80,
  //           bottom: height / 8,
  //           child: Center(
  //             child: Container(
  //               child: Text("©2023 Richard Digital Healthcare."),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
