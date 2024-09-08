import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reels_player/main.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
            body: controller.pages[controller.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                mouseCursor: MouseCursor.defer,
                elevation: Dimens.zero,
                backgroundColor: ColorsValue.primaryColor,
                currentIndex: controller.currentIndex,
                selectedItemColor: Colors.white,
                selectedLabelStyle: TextStyle(
                  fontSize: Dimens.fifteen,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: Dimens.fifteen,
                ),
                type: BottomNavigationBarType.fixed,
                onTap: controller.onBottomTap,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: Dimens.thirty,
                      ),
                      label: 'Home',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.smart_display_outlined,
                      size: Dimens.thirty,
                    ),
                    label: 'Reels',
                  ),
                ]),
          ));
}
