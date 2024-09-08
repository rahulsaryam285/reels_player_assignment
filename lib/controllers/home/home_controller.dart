import 'package:get/get.dart';
import 'package:reels_player/main.dart';

class HomeController extends GetxController {
  HomeController(this._viewModel);

  final HomeViewModel _viewModel;

  int currentIndex = 0;

  final pages = [
    const HomeWidget(),
    const ReelsView(),
  ];

  void onBottomTap(int value) {
    currentIndex = value;
    update();
    if (currentIndex == 0) return;
    if (!Get.isRegistered<ReelsController>()) {
      ReelsBinding().dependencies();
    }
  }
}
