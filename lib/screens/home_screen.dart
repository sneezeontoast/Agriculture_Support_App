import 'package:agriculture_support_app/data/home_data.dart';
import 'package:agriculture_support_app/demo_imports.dart';

import '../imports.dart';

const text_1 =
    "Lorem ipsum is a dummy text without any sense. It is a sequence of Latin words that, as they are positioned, do not form sentences with a complete sense, but give life to a test text useful to fill spaces that will subsequently be occupied from ad hoc texts composed by communication professionals. It is certainly the most famous placeholder text even if there are different versions distinguishable from the order in which the Latin words are repeated. Lorem ipsum contains the typefaces more in use, an aspect that allows you to have an overview of the rendering of the text in terms of font choice and font size . When referring to Lorem ipsum, different expressions are used, namely fill text , fictitious text , blind text or placeholder text : in short, its meaning can also be zero, but its usefulness is so clear as to go through the centuries and resist the ironic and modern versions that came with the arrival of the web.";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(8),
          // scrollDirection: Axis.vertical,
          children: <Widget>[
            const Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.green,
                  //decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ), // Text above the video
            ),
            //SizedBox(height: 0), // Reduced height
            ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: 300,
                    minHeight: 200,
                    maxWidth: 500,
                    minWidth: 200),
                child: Container(
                  child: ContextSlider(), // contents here
                )),

            Container(
              width: 1000, // Set the maximum width
              height: 700, // Set the maximum height
              child: Column(
                //alignment: Alignment.bottomRight,

                children: <Widget>[
                  // ListVerticalWidget(data_class: HomeStaticData()),
                  //Video_Player(video_link: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
                  Text('To The Agriculture Support App',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        // decoration: TextDecoration.underline,
                        // fontWeight: FontWeight.bold,
                      )),
                  // ListVerticalWidget(data_class: HomeStaticData()),
                  SizedBox(
                    width: 280,
                    height: 270,
                    child: ListVerticalWidget(data_class: HowToStaticData()),
                  ),
                  // Expanded(child: ListVerticalWidget(data_class: HowToStaticData())),

                  // CoolButton(),
                  Text(text_1),
                  // CourseScreen(title: 'Hello World')
                  // ElevatedButton(
                  //   child: Text('Do a compost course'),
                  //   onPressed: () {
                  //     CheckBox();
                  //   },
                  // ),
                ],
              ),
            ),
            //SizedBox(height: 0), // Adjust the size as needed
            // Text below the video
            //SizedBox(height: 10), // Adjust the size as needed
          ],
        ),
      ),
    );
  }
}
