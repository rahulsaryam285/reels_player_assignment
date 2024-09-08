import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reels_player/main.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Custom Reels Player
class ReelsVideoPlayer extends StatefulWidget {
  const ReelsVideoPlayer({
    Key? key,
    required this.videoUrl,
    required this.name,
  }) : super(key: key);

  final String videoUrl;

  final String name;

  @override
  State<ReelsVideoPlayer> createState() => _ReelsVideoPlayerState();
}

class _ReelsVideoPlayerState extends State<ReelsVideoPlayer> {
  VideoPlayerController? videoPlayerController;

  var isPlaying = true;

  var playPausedAction = false;

  var isDoubleTapped = false;

  var isVideoVisible = false;

  void playPause() async {
    playPausedAction = true;
    mountUpdate();
    await Future<void>.delayed(
      const Duration(milliseconds: 1000),
    );
    playPausedAction = false;
    mountUpdate();
  }

  @override
  void initState() {
    initializeVideoPlayer();
    super.initState();
  }

  void pauseVideoPlayer() {
    videoPlayerController?.setVolume(0);
    videoPlayerController?.pause();
    mountUpdate();
  }

  void playVideoPlayer() {
    videoPlayerController?.setVolume(1);
    videoPlayerController?.play();
    mountUpdate();
  }

  /// Method For Update The Tree Carefully
  void mountUpdate() {
    if (!mounted) return;
    setState(() {});
  }

  //initialize vide player controller
  void initializeVideoPlayer() async {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    if (videoPlayerController == null) return;
    try {
      await videoPlayerController?.initialize();
    } catch (e, st) {}
    await videoPlayerController?.setLooping(true);
    mountUpdate();
  }

  @override
  void dispose() {
    videoPlayerController?.pause();
    videoPlayerController?.setVolume(0.0);
    videoPlayerController?.dispose();
    videoPlayerController = null;
    super.dispose();
  }

  @override
  Widget build(context) => Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                isPlaying = !isPlaying;
                if (isPlaying) {
                  videoPlayerController?.pause();
                  playPause();
                } else {
                  videoPlayerController?.play();
                  playPause();
                }
              },
              onDoubleTap: () async {
                isDoubleTapped = true;
                mountUpdate();
                await Future<void>.delayed(const Duration(seconds: 1));
                isDoubleTapped = false;
                mountUpdate();
              },
              onLongPressStart: (details) {
                videoPlayerController?.pause();

                mountUpdate();
              },
              onLongPressEnd: (value) {
                videoPlayerController?.play();
                mountUpdate();
              },
              child: VisibilityDetector(
                key: Key('${widget.videoUrl}'),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction > 0.1) {
                    isVideoVisible = true;
                    mountUpdate();
                    if (videoPlayerController?.value.isPlaying == false) {
                      videoPlayerController?.seekTo(Duration.zero);
                      videoPlayerController?.play();
                      isPlaying = !isPlaying;
                      mountUpdate();
                    }
                  } else {
                    isVideoVisible = false;
                    mountUpdate();
                    if (videoPlayerController?.value.isPlaying == true) {
                      videoPlayerController?.pause();
                      isPlaying = !isPlaying;
                      mountUpdate();
                    }
                  }
                },
                child: SizedBox(
                  width: Get.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      videoPlayerController != null &&
                              videoPlayerController?.value.isInitialized == true
                          ? AspectRatio(
                              aspectRatio:
                                  videoPlayerController?.value.aspectRatio ?? 1,
                              child: VideoPlayer(videoPlayerController!),
                            )
                          : const SizedBox.shrink(),
                      ClipRRect(
                        borderRadius: BorderRadius.zero,
                        child: SizedBox(
                          width: Get.width,
                          child: Container(
                            height: Get.height,
                            width: Get.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  ColorsValue.blackColor.withOpacity(.6),
                                  ColorsValue.blackColor.withOpacity(.0),
                                  ColorsValue.blackColor.withOpacity(.0),
                                  ColorsValue.blackColor.withOpacity(.4),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              top: false,
              right: false,
              left: false,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                        color: ColorsValue.whiteColor,
                      ),
                    ),
                    Dimens.boxHeight20,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off_outlined,
                        color: ColorsValue.whiteColor,
                      ),
                    ),
                    Dimens.boxHeight20,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: ColorsValue.whiteColor,
                      ),
                    ),
                    Dimens.boxHeight20,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share_outlined,
                        color: ColorsValue.whiteColor,
                      ),
                    ),
                    Dimens.boxHeight20,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.report_outlined,
                        color: ColorsValue.whiteColor,
                      ),
                    ),
                    Dimens.boxHeight20,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: Dimens.edgeInsets0.copyWith(
                  left: Dimens.fifteen,
                  bottom: Dimens.fifteen,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: Dimens.fifty,
                      width: Dimens.fifty,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorsValue.whiteColor,
                          width: Dimens.one,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        widget.name[0],
                        style: TextStyle(
                          fontSize: Dimens.fifteen,
                          color: ColorsValue.whiteColor,
                        ),
                      ),
                    ),
                    Dimens.boxWidth10,
                    Text(
                      widget.name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: Dimens.fifteen,
                        color: ColorsValue.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: playPausedAction ? 1.0 : 0.0,
              duration: const Duration(
                milliseconds: 500,
              ),
              child: GestureDetector(
                  onTap: () {
                    if (isPlaying) {
                      videoPlayerController?.pause();
                      playPause();
                    } else {
                      videoPlayerController?.play();
                      playPause();
                    }
                    isPlaying = !isPlaying;
                    mountUpdate();
                  },
                  onDoubleTap: () async {
                    isDoubleTapped = true;
                    mountUpdate();
                    await Future<void>.delayed(
                      const Duration(milliseconds: 1000),
                    );
                    isDoubleTapped = false;
                    mountUpdate();
                  },
                  onLongPressStart: (details) {
                    videoPlayerController?.pause();

                    mountUpdate();
                  },
                  onLongPressEnd: (value) {
                    videoPlayerController?.play();

                    mountUpdate();
                  },
                  child: Icon(
                    isPlaying
                        ? Icons.pause_outlined
                        : Icons.play_circle_outlined,
                    size: Dimens.fifty,
                    color: ColorsValue.whiteColor,
                  )),
            ),
          ],
        ),
      );
}
