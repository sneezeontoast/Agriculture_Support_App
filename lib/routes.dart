
import 'package:agriculture_support_app/screens/compost_course_home.dart';
import 'package:agriculture_support_app/widgets/dummy_screen.dart';

import 'imports.dart';
import 'demo_imports.dart';

List screenData_1 = [
  {"type": "subtitle", "content": "How To Build Compost To Feed Your Plants And Reduce Waste"},
  {
    "type": "video",
    "content":
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  },
  {"type": "bulletpoint", "content": "Use green and brown materials"},
  {"type": "text", "content": "To make your own hot compost heap wait until you have a enough materials to make a pile of compost at least 3 feat deep with a combination of wet (green) items dry items brown materials include dryed plant materials fallen leaves shreaded tree branches cardboard newspaper hay straw and wood shavings. These items add carbon. Green materials include kitchen scraps coffee grounds animal manure (not from dogs or cats) and then, fresh plant and grass trimmings. These Items add nitrogen. "},
  {"type": "text", "content": "For best results start building your compost by mixing three parts brown materials with one part green material. If your compost pile looks to wet and smells unpleasant add more brown items or mix your compost with a garden fork to aerate. if you see it looks extremly brown and dry add green items and water to make it slightly moist."},


];

List screenData_2 = [
  {"type": "subtitle", "content": "How To Make Your Compost Work And Better Than Fertiliser"},
  {
    "type": "video",
    "content":
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  },
  {"type": "bulletpoint", "content": "Use green and brown materials"},
  {"type": "text", "content": "To make your own hot compost heap wait until you have a enough materials to make a pile of compost at least 3 feat deep with a combination of wet (green) items dry items brown materials include dryed plant materials fallen leaves shreaded tree branches cardboard newspaper hay straw and wood shavings. These items add carbon. Green materials include kitchen scraps coffee grounds animal manure (not from dogs or cats) and then, fresh plant and grass trimmings. These Items add nitrogen. "},
  {"type": "text", "content": "For best results start building your compost by mixing three parts brown materials with one part green material. If your compost pile looks to wet and smells unpleasant add more brown items or mix your compost with a garden fork to aerate. if you see it looks extremly brown and dry add green items and water to make it slightly moist."},



];
List screenData_3 = [
  {"type": "subtitle", "content": "How To Turn Your Compost To Produce The Best Compost"},
  {
    "type": "video",
    "content":
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  },
  {"type": "bulletpoint", "content": "Turn at apropriate Times"},
  {"type": "text", "content": "To make your own hot compost heap wait until you have a enough materials to make a pile of compost at least 3 feat deep with a combination of wet (green) items dry items brown materials include dryed plant materials fallen leaves shreaded tree branches cardboard newspaper hay straw and wood shavings. These items add carbon. Green materials include kitchen scraps coffee grounds animal manure (not from dogs or cats) and then, fresh plant and grass trimmings. These Items add nitrogen. "},
  {"type": "text", "content": "For best results start building your compost by mixing three parts brown materials with one part green material. If your compost pile looks to wet and smells unpleasant add more brown items or mix your compost with a garden fork to aerate. if you see it looks extremly brown and dry add green items and water to make it slightly moist."},



];
var customRoutes = <String, WidgetBuilder>{
  '/': (context) => MyHomePage(),
  '/demo_home': (context) => DemoHomeScreen(),
  '/dummy_screen': (context) => DummyScreen(),
  '/course_home_screen': (context) => CompostOverveiw(),
  '/compost_intro': (context) => CompostIntro(),
  '/compost_course_stage_1': (context) => CourseTutorial(title: "Build A Compost Pile", stage: 1.toString(), screenData: screenData_1),
  '/compost_course_stage_2': (context) => CourseTutorial(title: "Looking After Compost", stage: 2.toString(), screenData: screenData_2),
  '/compost_course_stage_3': (context) => CourseTutorial(title: "Turning Your Compost", stage: 3.toString(), screenData: screenData_3)
  
  //compost_intro
  //'/demo_weather': (context) => DemoApiListScreen(),
};