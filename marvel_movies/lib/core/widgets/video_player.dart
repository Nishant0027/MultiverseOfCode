import 'package:flutter/material.dart';
import 'package:marvel_movies/core/constants/app_constants/app_constants.dart';

import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String trailerUrl;
  const VideoPlayerWidget({super.key, required this.trailerUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(widget.trailerUrl)
          ..play()
          // ..addListener(() => setState(() {}))
          ..setLooping(false)
          ..initialize().then((value) {
            if (mounted == true) {
              setState(() {
                _videoPlayerController.play();
              });
            }
          });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.backgroundGrey,
      height: 200,
      width: double.maxFinite,
      child:
          _videoPlayerController.value.isInitialized
              ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: Stack(
                  children: [
                    const Icon(Icons.play_arrow, color: AppConstants.white),
                    VideoPlayer(_videoPlayerController),
                  ],
                ),
              )
              : const Center(
                child: CircularProgressIndicator(
                  color: AppConstants.white,
                  strokeWidth: 1,
                ),
              ),
    );
  }
}
