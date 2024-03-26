import 'package:agriculture_support_app/data/home_data.dart';
// import 'package:agriculture_support_app/demo_imports.dart';
import 'package:agriculture_support_app/widgets/course_scroll.dart';

import '../imports.dart';
import '../demo_imports.dart';

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
  List screenData = [
    {"type": "subtitle", "content": "How To Make Compost To Feed Your Plants And Reduce Waste"},
    {
      "type": "video",
      "content":
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
    },
    {"type": "bulletpoint", "content": "Use green and brown materials"},
    {"type": "text", "content": "To make your own hot compost heap wait until you have a enough materials to make a pile of compost at least 3 feat deep with a combination of wet (green) items dry items brown materials include dryed plant materials fallen leaves shreaded tree branches cardboard newspaper hay straw and wood shavings. These items add carbon. Green materials include kitchen scraps coffee grounds animal manure (not from dogs or cats) and then, fresh plant and grass trimmings. These Items add nitrogen. "},
    {"type": "text", "content": "For best results start building your compost by mixing three parts brown materials with one part green material. If your compost pile looks to wet and smells unpleasant add more brown items or mix your compost with a garden fork to aerate. if you see it looks extremly brown and dry add green items and water to make it slightly moist."},



  ];

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
        children: [ // The list of widgets that are displayed when a tab is selected
          const HomeScreen(), // Each child is a single tab view in the TabBarView
          // Center(child: Text("You are in How To")),
          // Center(child: Text("you are in More")),
          // DemoListHorizontalWidget()
          // ContextSlider(),
          // CoolButton()
          // HowToScreen(),
          Expanded(child: ListVerticalWidget(data_class: HomeStaticData())),
          // CompostIntro()
          // Center(child: Text("you are in More"))
          // ListVerticalWidget(data_class: HomeStaticData())
          // UnlockButton(myIconUnlocked: true)
          // CourseScroll(),
          // CourseScroll(),
          // HowToScreen(),
          //
          CourseTutorial(title: "How To Build Compost", stage: 1.toString(), screenData: screenData)
          // CourseTutorial(title: "Title ", stage: 1.toString(),)

        ],
      ),
    );
  }
}


