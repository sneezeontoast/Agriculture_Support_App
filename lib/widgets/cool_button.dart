import '../imports.dart';

class CoolButton extends StatefulWidget {

  const CoolButton({super.key});

  @override
  State<CoolButton> createState() => _CoolButtonState();
}

class _CoolButtonState extends State<CoolButton> {

  String currentImage = 'lib/assets/compost_button.jpg';


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        height: 100,
        child: Card(
          elevation: 6,
          color: Colors.transparent,
          semanticContainer: true,
          // Implement InkResponse
          child: InkResponse(
            containedInkWell: true,
            highlightShape: BoxShape.rectangle,
            onTap: () {
              // Update the state variable when the image is pressed.
              setState(() {
                currentImage = 'lib/assets/compost_button.jpg';
                Navigator.push(

                  context,
                  MaterialPageRoute(builder: (context) => CourseScreen()),
                  // MaterialPageRoute(builder: (context) => CourseScreen(
                  //     title: 'Compost', text_1: 'hello hevkcvef',
                  //     text_2: "i have done it",
                  //     video_link: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')),
                );
              });
            },
            // Add image
            child: Ink.image(
              width: double.infinity,
              height: 110,
              fit: BoxFit.cover,
              image: AssetImage(currentImage),
            ),
          ),
        ),
      ),
    );
  }
}

