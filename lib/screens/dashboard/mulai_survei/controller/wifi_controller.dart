import 'package:video_player/video_player.dart';

class WiFiController {
  late VideoPlayerController videoController;

  Future<void> initializeStream() async {
    // ignore: deprecated_member_use
    videoController = VideoPlayerController.network('http://10.5.5.113/live');
    await videoController.initialize();
  }

  void playStream() {
    videoController.play();
  }

  void stopStream() {
    videoController.pause();
  }
}
