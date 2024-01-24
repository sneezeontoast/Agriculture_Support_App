import '../demo_imports.dart';

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
            Expanded(child: DemoListVerticalWidget()) // Vertical Listview from demo data JSON String
          ],
        ),
      ),
    );
  }
}
