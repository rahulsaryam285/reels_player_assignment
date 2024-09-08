import 'package:get/get.dart';
import 'package:reels_player/controllers/home/home_controller.dart';
import 'package:reels_player/repositories/repositories.dart';
import 'package:reels_player/view_models/view_models.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        HomeViewModel(
          HomeRepository(),
        ),
      ),
    );
  }
}
