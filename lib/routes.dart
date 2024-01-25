
import 'imports.dart';
import 'demo_imports.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => HomeScreen(),
  '/demo_home': (context) => DemoHomeScreen(),
  '/demo_weather': (context) => DemoApiListScreen(),
};