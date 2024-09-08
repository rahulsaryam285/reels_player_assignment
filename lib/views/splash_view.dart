import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reels_player/controllers/controllers.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String route = '/splash';

  @override
  Widget build(BuildContext context) => GetBuilder<SplashController>(
      builder: (context) => const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterLogo(),
                  SizedBox(height: 30),
                  Text('Instagram Reels Feature'),
                ],
              ),
            ),
          ));
}
