import '../imports.dart';

class CourseTutorial extends StatelessWidget {
  final String title;
  final String stage;
  final List screenData;
  CourseTutorial({super.key, required this.title, required this.stage, required this.screenData});



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 27,

          ),
        ),
        backgroundColor: Colors.lightGreen,
        actions: <Widget>[
          Text(
            stage,
            style: const TextStyle(
              fontSize: 15,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: screenData.length, // Length of the data source
          itemBuilder: (context, index) {
            // Convert each item to a ScreenItem just when it's needed for rendering
            var item = screenData[index]; // Covert item from raw list item
            // ListTile is a default widget in flutter. You can create your own widget for this
            if (item['type'] == "title") {
              return Text(item['content'], style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold));
            } else if (item['type'] == "subtitle") {
              return Padding(
                  padding: const EdgeInsets.all(17.9),
                      child: Text(item['content'], style: const TextStyle(fontSize: 24.0))
              );

            } else if (item['type'] == "quote") {
              return Text(item['content'],
                  style:
                  const TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic));
            } else if (item['type'] == "tracker") {
              return const CourseScroll();
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

            }
            else if (item['type'] == "text") {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(item['content'],
                  style: const TextStyle(fontSize: 14.0

                  ),
                ),
              );
            } else if (item['type'] == "bulletpoint") {
              return Center(
                child: Text(
                  "\u2022" + item['content'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.5,

                  ),
                )
              );
            } else {
              return const Text(" ");
            }
          })

    );
  }
}
