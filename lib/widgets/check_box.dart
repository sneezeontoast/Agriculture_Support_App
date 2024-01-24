import '../imports.dart';

class CheckBox extends StatefulWidget {

  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {

  String currentImage = 'lib/assets/box.png';


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 30,
        height: 34,
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
               currentImage = 'lib/assets/checked_box.png';
              });
            },
            // Add image
            child: Ink.image(
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
              image: AssetImage(currentImage),
            ),
          ),
        ),
      ),
    );
  }
}

