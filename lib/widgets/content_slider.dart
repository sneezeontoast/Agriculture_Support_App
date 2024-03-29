
import '../imports.dart';
import '../demo_imports.dart';

class ContextSlider extends StatelessWidget {
  const ContextSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return
            Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.width/16) *9,
              child: DemoSliderWidget(
                children: [
                  // Your widgets here
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(15.0),
                    child: const Column(
                      children: [
                        Text('Tip Of the day', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),)
                      ],
                    ),
                  ),
                  const Video_Player(video_link: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
                  Container(color: Colors.blue,
                    child: const Center(
                      child: Text('Trust in the Lord with all your heart, and lean not on your own understanding. In all your ways, acknowledge Him, and He shall make your paths straight.'),
                    ),),
                  Container(color: Colors.green,
                    child: const Center(
                      child: Text('You should start composting!!'),
                    ),
                  ),
                ],
                switchDuration: const Duration(seconds: 15), // Change this value to adjust auto-slide duration
              ),
            );
            //Expanded(child: DemoListVerticalWidget()) // Vertical Listview from demo data JSON String
            //Text('hello'),

  }
}

