import 'dart:async';

import 'package:beauty_connect_guest/constants/global_variables.dart';
import 'package:beauty_connect_guest/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    // getData();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Spacer(),
            SizedBox(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Image.asset(
                  "assets/images/app_logo.png",
                  scale: 2,
                ),
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: 50,
              width: 50,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
              SpinKitCircle(
              color: Colors.white,
                size: 50.0,
              ),
                ],
              ),
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
