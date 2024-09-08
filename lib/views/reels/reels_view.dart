import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reels_player/main.dart';

class ReelsView extends StatelessWidget {
  const ReelsView({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<ReelsController>(
        initState: (state) {
          Get.find<ReelsController>().cureentReel();
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        },
        dispose: (state) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        },
        builder: (controller) => Container(
          height: Dimens.percentHeight(1),
          color: ColorsValue.blackColor,
          child: controller.isReelsLoading
              ? const AppLoader()
              : PageView.builder(
                  allowImplicitScrolling: true,
                  physics: const ClampingScrollPhysics(),
                  clipBehavior: Clip.none,
                  controller: controller.reelsController,
                  onPageChanged: (value) {
                    controller.currentReel = value;
                    controller.update();
                  },
                  itemCount: controller.reels.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final reels = controller.reels[index];
                    return ReelsVideoPlayer(
                      key: Key('index$index'),
                      name: reels.userName,
                      videoUrl: reels.videoUrl,
                    );
                  },
                ),
        ),
      );
}
