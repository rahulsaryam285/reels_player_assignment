import 'package:get/get.dart';
import 'package:reels_player/utils/navigators/app_pages.dart';

abstract class RouteManagement {
  /// Go to the Home Screen
  static void goToHome() {
    Get.offAllNamed<void>(
      Routes.home,
    );
  }
}
