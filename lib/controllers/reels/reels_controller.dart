import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reels_player/main.dart';

class ReelsController extends GetxController {
  ReelsController(this._viewModel);

  final ReelsViewModel _viewModel;

  bool isReelsLoading = false;

  int currentReel = 0;

  var reelsController = PageController();

  @override
  void onInit() {
    super.onInit();
    startInit();
  }

  void startInit() async {
    isReelsLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    isReelsLoading = false;
    update();
  }

  void cureentReel() {
    reelsController = PageController(
      initialPage: currentReel,
      keepPage: true,
    );
  }

  final reels = [
    ReelsModel(
      userName: 'Tiger Nixon',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/c014b038-e605-4b25-a018-8fb97e41e487/FileGroup1/6634857baa7f111cbf6ceb09_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Garrett Winters',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/eb0b893f-2f5f-4c0a-9a09-192570b83386/FileGroup1/663879a2aa7f11f6b76cebb1_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Ashton Cox',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/04a23aa9-3fa2-4819-80a4-c91443ed810f/FileGroup1/66da90ca72f1f840f2ccb95c_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Cedric Kelly',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/a513c638-6970-422e-b0e9-29803bc03560/FileGroup1/667e1cad2362361e18d54c32_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Airi Satou',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/cce12bf2-4b29-4fab-a38e-7e9648e3e4e4/FileGroup1/66d9559d72f1f840f2ccb94a_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Brielle Williamson',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/af3c6c90-c425-416d-a438-fecbd6d64ef9/FileGroup1/663371b6bb358672350e234b_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Herrod Chandler',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/fab98dcc-a44c-41b9-89b7-e57d4d50cb43/FileGroup1/66d9524a72f1f840f2ccb948_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Rhona Davidson',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/d7661175-bd24-4727-95f9-e9b4377b6ba7/FileGroup1/66d94eee72f1f840f2ccb946_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Colleen Hurst',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/f972c420-5295-49d8-89bb-99f617e3433a/FileGroup1/66336e35bb358629f90e233a_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Sonya Frost',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/c014b038-e605-4b25-a018-8fb97e41e487/FileGroup1/6634857baa7f111cbf6ceb09_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Jena Gaines',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/05702d01-2968-4b7e-86ca-992f837a97bc/FileGroup1/6638c75b0af0c81c3139892a_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Quinn Flynn',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/41e205e6-bf7c-452c-ad3e-b46d53c3ed1d/FileGroup1/6669e746e0e79f0455964156_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Ashton Cox',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/cce12bf2-4b29-4fab-a38e-7e9648e3e4e4/FileGroup1/66d9559d72f1f840f2ccb94a_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Jena Gaines',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/6bc9de74-36d1-49e8-9ccf-50ef5208cad7/FileGroup1/665203945f8177ae4831a81a_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Sonya Frost',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/793e0f68-141a-458d-98fc-447fd9ba6de6/FileGroup1/664f2772597648ddc0e77a6e_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Colleen Hurst',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/63b12cb7-c324-4d7b-b251-9bfe6de2d9be/FileGroup1/660f7acbad29dd7d8ef8fcf3_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Rhona Davidson',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/25fb4db0-c366-403b-bbf0-cbf84e92c7a0/FileGroup1/664404d0477cfa3d5ca39a63_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Herrod Chandler',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/592f26b8-410b-410c-a3cb-98de3b63c442/FileGroup1/6638c60a0af0c8938d398926_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Brielle Williamson',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/88534914-9e61-4f18-b3f1-cd17b352b651/FileGroup1/66446931477cfa3d5ca39a83_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Airi Satou',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/c165d84b-e368-429d-b9c9-e48ab3340391/FileGroup1/66b36d3e0587fbb05dd1342f_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Cedric Kelly',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/eb0b893f-2f5f-4c0a-9a09-192570b83386/FileGroup1/663879a2aa7f11f6b76cebb1_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Herrod Chandler',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/a513c638-6970-422e-b0e9-29803bc03560/FileGroup1/667e1cad2362361e18d54c32_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Cedric Kelly',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/04a23aa9-3fa2-4819-80a4-c91443ed810f/FileGroup1/66da90ca72f1f840f2ccb95c_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Garrett Winters',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/c014b038-e605-4b25-a018-8fb97e41e487/FileGroup1/6634857baa7f111cbf6ceb09_post_1.mp4',
    ),
    ReelsModel(
      userName: 'Tiger Nixon',
      videoUrl:
          'https://d1f6roadjup1cr.cloudfront.net/af3c6c90-c425-416d-a438-fecbd6d64ef9/FileGroup1/663371b6bb358672350e234b_post_1.mp4',
    ),
  ];
}
