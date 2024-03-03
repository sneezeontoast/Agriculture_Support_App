
import '../imports.dart';
import '../demo_imports.dart';

class ContextSlider extends StatelessWidget {
  const ContextSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text('Tip Of the day', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),)
                      ],
                    ),
                  ),
                  Video_Player(video_link: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
                  Container(color: Colors.blue,
                    child: Center(
                      child: Text('Trust in the Lord with all your heart, and lean not on your own understanding. In all your ways, acknowledge Him, and He shall make your paths straight.'),
                    ),),
                  Container(color: Colors.green,
                    child: Center(
                      child: Text('You should start composting!!'),
                    ),
                  ),
                ],
                switchDuration: Duration(seconds: 15), // Change this value to adjust auto-slide duration
              ),
            ),
            //Expanded(child: DemoListVerticalWidget()) // Vertical Listview from demo data JSON String
            //Text('hello'),
          ],
        ),
      ),
    );
  }
}

