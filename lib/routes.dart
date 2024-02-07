
import 'package:agriculture_support_app/widgets/dummy_screen.dart';

import 'imports.dart';
import 'demo_imports.dart';

var customRoutes = <String, WidgetBuilder>{
  '/home': (context) => MyHomePage(),
  '/demo_home': (context) => DemoHomeScreen(),
  '/dummy_screen': (context) => DummyScreen(),
  '/course_screen': (context) => CourseScreen(),
  '/compost_intro': (context) => CompostIntro(),
  //'/demo_weather': (context) => DemoApiListScreen(),
  '/': (context) => DemoInformationScreen()
};