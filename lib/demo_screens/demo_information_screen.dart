import 'package:agriculture_support_app/demo_imports.dart';

import '../imports.dart';
import '../widgets/VideoPlayer.dart';

//------------------------------------------------------------------------------
// This screen displays lists of data to form pages of normal content
// where the screen adjust dynamically to the data source provided
// e.g. Titles, sub-titles, text, bullet points, images, video etc
//------------------------------------------------------------------------------

class DemoInformationScreen extends StatelessWidget {
  DemoInformationScreen({super.key});

  List screenData = [
    {"type": "title", "content": "This is a title."},
    {"type": "tracker", "content": ""},
    {"type": "quote", "content": "'This is a quote.'"},
    {"type": "text", "content": "This is text."},
    {"type": "text", "content": "This is text."},
    {
      "type": "video",
      "content":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
    },
    {"type": "title", "content": "This is another title."},
    {
      "type": "video",
      "content":
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: screenData.length, // Length of the data source
            itemBuilder: (context, index) {
              // Convert each item to a ScreenItem just when it's needed for rendering
              var item = screenData[index]; // Covert item from raw list item
              // ListTile is a default widget in flutter. You can create your own widget for this
              if (item['type'] == "title") {
                return Text(item['content'], style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold));
              } else if (item['type'] == "subtitle") {
                return Text(item['content'], style: TextStyle(fontSize: 17.0));
              } else if (item['type'] == "quote") {
                return Text(item['content'],
                    style:
                        TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic));
              } else if (item['type'] == "tracker") {
                return DemoCourseTracker();
              }
              else if (item['type'] == "video") {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Video_Player(video_link: item['content']),
                    ),
                  ),
                );
              } else {
                return Text("");
              }
            }));
  }
}
