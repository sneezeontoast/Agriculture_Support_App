import '../demo_imports.dart';
import '../imports.dart';

// DEPENDANCIES EXPORTED FROM demo_imports.dart --------------------------------
// import '../demo_data/demo_drawer.dart'; // Drawer menu
// import '../demo_data/demo_list_vertical_widget.dart'; // List
// -----------------------------------------------------------------------------

//------------------------------------------------------------------------------
// This screen is a basic home screen layout with key widgets
//------------------------------------------------------------------------------


class DemoHomeScreen extends StatelessWidget {
  const DemoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Home'), // Title in App Bar on the screen
        // Add a button on the left hand side to show the menu button
        leading: IconButton(
          icon: Icon(Icons.menu), // Icon in left side of AppBar
          onPressed: (){
            Scaffold.of(context).openDrawer(); // Opens Drawer
          },),
        // actions allows buttons or icons to be added to right side of menu
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: (){
              // Add functionality to access help
            },
          )
        ],
      ),
      // Drawer is used to add a popout menu on the left side
      // endDrawer for a menu on the right
      // You can add the drawer before or after the body. The menu could be
      // created as a seperate widget and imported and used for easier code
      // to read
      drawer: DemoDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(15.0), // Provide padding around the page content
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.width/16) *9,
              child: DemoSliderWidget(
                children: [
                  // Your widgets here
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text('Container 1', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),)
                    ],
                  ),
                  ),
                  Video_Player(video_link: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
                  Container(color: Colors.blue,
                  child: Center(
                    child: Text('Trust in the Lord with all your heart, and lean not on your own understanding. In all your ways, acknowledge Him, and He shall make your paths straight.'),
                  ),),
                  Container(color: Colors.green),
                ],
                switchDuration: Duration(seconds: 15), // Change this value to adjust auto-slide duration
              ),
            ),
            Expanded(child: DemoListVerticalWidget()) // Vertical Listview from demo data JSON String
          ],
        ),
      ),
    );
  }
}
