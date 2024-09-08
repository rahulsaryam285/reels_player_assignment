import 'package:get/get.dart';
import 'package:reels_player/utils/navigators/navigators.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startOnInit();
  }

  void startOnInit() async {
    await Future.delayed(const Duration(seconds: 1));
    RouteManagement.goToHome();
  }
}
