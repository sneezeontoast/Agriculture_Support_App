import '../imports.dart';

class DummyScreen extends StatelessWidget {
  // final String title;
  // final String text_1;
  // final String text_2;

  // final String video_link;
  // const CourseScreen({Key? key, required this.title, required this.text_1, required this.text_2, required this.video_link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Title', style: Theme.of(context).textTheme.bodyMedium),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Para_1', style: Theme.of(context).textTheme.bodyMedium),

            Text('Para_2', style: Theme.of(context).textTheme.bodyMedium),

            // Video_Player(video_link: video_link)
          ],
        )


    );
  }
}
