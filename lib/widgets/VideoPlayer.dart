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
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        widget.video_link))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _initialisePlayer();
      });


  }


  void _initialisePlayer() async {
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(videoPlayerController:
    _videoPlayerController,
    autoPlay: false,
      looping: false,

    );
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      child:

       _videoPlayerController != null && _videoPlayerController.value.isInitialized? Chewie(
          controller: _chewieController
          ,):const Text(r"Loading... ¯\_(ツ)_/¯"),
    );

  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
