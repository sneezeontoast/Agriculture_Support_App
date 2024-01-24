// Import my import file which imports everything
import 'imports.dart';
import 'demo_screens/demo_api_list_screen.dart';
//import 'package:webview_flutter/webview_flutter.dart';



// the reason why there is a gap between video and bottom text is it is in a seperate colum

//import 'package:flutter_inappwebview-master'
// The main function is the starting point for all Flutter app
const context = Text('Hi This is cool');
void main() {return
  runApp(MyApp());
}

// MyApp is a StatelessWidget which is the root of your application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp is a predefined class in flutter which gives many features like theme, routing etc
    //debugShowCheckedModeBanner: false,
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agricultural Support App!', // The title that Android shows for your app
      theme: ThemeData(
        primarySwatch: Colors.green, // The primary color of your app
      ),
      home: DemoApiListScreen(), // The widget that will be shown when the app is run
    );
  }
}

// MyHomePage is a StatefulWidget which can maintain state that can change over time
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState(); // Creates the mutable state for this widget
}

// _MyHomePageState is the state for MyHomePage
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController; // Declare _tabController using the 'late' keyword

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Initialize _tabController in initState
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout structure where you can put AppBar, BottomNavigationBar, Drawer, FloatingActionButton etc
    return Scaffold(
      appBar: AppBar( // AppBar is a predefined class in flutter. It gives us the top bar with some properties
        title: const Text('Agricultural support app'), // The title text in the AppBar
        backgroundColor: Colors.green,

        bottom: TabBar( // TabBar is a Material Design widget for displaying a horizontal row of tabs
          controller: _tabController,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 5.0),
            insets: EdgeInsets.symmetric(horizontal: 16.0)
          ),// The TabController for the TabBar
          tabs: const [ // The list of tabs
            Tab(icon: Icon(Icons.home), text: 'Home'), // Each Tab is a single tab in the TabBar
            Tab(icon: Icon(Icons.find_in_page), text: "How To"),
            Tab(icon: Icon(Icons.menu), text: 'More'),
          ],
        ),
      ),
      body: TabBarView( // TabBarView is a page view that displays the widget which corresponds to the currently selected tab
        controller: _tabController, // The TabController for the TabBarView
        children: const [ // The list of widgets that are displayed when a tab is selected
          VideoApp(), // Each child is a single tab view in the TabBarView
          SimpleScreen(title: 'how to', text_1: 'This is how to do stuff', text_2: "We Hoped you enjouyed the video", video_link: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
          // Center(child: Text("You are in How To")),
          Center(child: Text("you are in More")),
        ],
      ),
    );
  }
}


