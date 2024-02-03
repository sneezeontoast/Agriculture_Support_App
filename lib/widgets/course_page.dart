import '../imports.dart';

class CourseScreen extends StatelessWidget {
  // final String title;
  // final String text_1;
  // final String text_2;

  // final String video_link;
  // const CourseScreen({Key? key, required this.title, required this.text_1, required this.text_2, required this.video_link}) : super(key: key);
  String title = 'Title';
  String para_1 = 'Paragraph 1';
  String para_2 = 'Paragraph 2';
  String video_link = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(para_1),
          Video_Player(video_link: video_link),
          Text(para_2),
          CheckBox(),
          // Video_Player(video_link: video_link)
      ],
      )


    );
  }
}
