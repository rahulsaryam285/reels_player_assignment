import 'package:get/get.dart';
import 'package:reels_player/main.dart';

class ReelsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ReelsController>(
      ReelsController(
        ReelsViewModel(
          ReelsRepository(),
        ),
      ),
    );
  }
}
