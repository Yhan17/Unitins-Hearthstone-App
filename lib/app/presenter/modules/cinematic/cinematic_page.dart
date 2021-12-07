import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../core/routes/routes.dart';
import '../../shared/theme/app_videos.dart';

class CinematicPage extends StatefulWidget {
  const CinematicPage({Key? key}) : super(key: key);

  @override
  State<CinematicPage> createState() => _CinematicPageState();
}

class _CinematicPageState extends State<CinematicPage> {
  static final videoPlayerController =
      VideoPlayerController.asset(AppVideos.cinematic);
  static ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    _initializeController(videoPlayerController);

    videoPlayerController.addListener(() {
      if (videoPlayerController.value.position ==
          videoPlayerController.value.duration) {
        AppRoutes.home.push(context, arguments: noArgs);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: chewieController != null &&
                    chewieController!.videoPlayerController.value.isInitialized
                ? Chewie(
                    controller: chewieController!,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text('Loading'),
                    ],
                  ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.green,
            child: const Center(
              child: Text('Teste'),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  Future<void> _initializeController(VideoPlayerController controller) async {
    await Future.wait([controller.initialize()]);
    _initializeChewie();
    setState(() {});
  }

  void _initializeChewie() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      fullScreenByDefault: true,
      showOptions: false,
      autoInitialize: true,
      showControls: false,
    );
  }
}
