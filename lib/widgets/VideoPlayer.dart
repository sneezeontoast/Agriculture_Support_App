import '../imports.dart';

// const video_link = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

class Video_Player extends StatefulWidget {
  // const Video_Player({super.key});
  final String video_link;
  const Video_Player({Key? key, required this.video_link}) : super(key: key);
  @override
  State<Video_Player> createState() => _Video_PlayerState();
}

class _Video_PlayerState extends State<Video_Player> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController; // Make this nullable

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.video_link)
      ..initialize().then((_) {
        _initialisePlayer();
      });
  }

  void _initialisePlayer() async {
    // Ensure _videoPlayerController is initialized before using it
    await _videoPlayerController.initialize();
    setState(() {
      // Initialize ChewieController here and set state to rebuild the widget
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: false,
        looping: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      child: _chewieController != null && _videoPlayerController.value.isInitialized
          ? Chewie(
        controller: _chewieController!,
      )
          : const Text("Loading... ¯\\_(ツ)_/¯"),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose(); // Use ?. since _chewieController is nullable
    super.dispose();
  }
}
