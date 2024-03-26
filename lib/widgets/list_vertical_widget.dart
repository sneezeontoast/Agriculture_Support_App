// import 'package:agriculture_support_app/data/home_data.dart';

import '../demo_imports.dart';
import '../imports.dart';
// import '../routes.dart';

// DEPENDANCIES EXPORTED FROM demo_imports.dart --------------------------------
// import 'dart:convert' - Required for this screen but added in demo_imports
// import '../demo_data/demo_list_data_model.dart'; // model to parse data
// import '../demo_data/demo_static_data.dart'; // Source of data for list
// -----------------------------------------------------------------------------

//------------------------------------------------------------------------------
// This widget displays a vertical list of widgets
//------------------------------------------------------------------------------

class ListVerticalWidget extends StatefulWidget {
  final data_class;
  const ListVerticalWidget({Key? key, required this.data_class})
      : super(key: key);

  @override
  State<ListVerticalWidget> createState() => _ListVerticalWidgetState();
}

class _ListVerticalWidgetState extends State<ListVerticalWidget> {
  List screenData = [];

  @override
  Widget build(BuildContext context) {
    List<dynamic> rawList = json
        .decode(widget.data_class.demoListData); // Converts JSON String to List

    // Listview Builder takes data and uses it to create a list of widgets based on the data
    return Scaffold(
        backgroundColor: Colors.yellow[20],

        body: ListView.builder(
          itemCount: rawList.length, // Length of the data source
          itemBuilder: (context, index) {
            // Convert each item to a ScreenItem just when it's needed for rendering
            DemoListItem item = DemoListItem.fromJson(
                rawList[index]); // Covert item from raw list item
            // ListTile is a default widget in flutter. You can create your own widget for this
            return ListTile(
              leading: item.image.isNotEmpty
                  ? const Icon(
                Icons.photo,
                size: 50.0,
                color: Colors.green,
              )
                  : null, // Only displays if image available
              title: Text(item.title, style: Theme.of(context).textTheme.bodyMedium),
              subtitle: Text(item.details, style: Theme.of(context).textTheme.bodyMedium),
              // route: Text(item.r),
              // navigate: Text(item.navigate),
              onTap: () {
                // Update the state variable when the image is pressed.
                setState(() {
                  Navigator.pushNamed(context, '/compost_intro');
                  // MaterialPageRoute(builder: (context) => CourseScreen(
                  //     title: 'Compost', text_1: 'hello hevkcvef',
                  //     text_2: "i have done it",
                  //     video_link: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')),
                });
              },
            );
          },
        )

    );


  }
}
