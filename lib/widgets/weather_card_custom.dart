import '../imports.dart';

class WeatherCardCustom extends StatefulWidget {

  String image;
  String title;
  WeatherCardCustom({super.key, required this.image, required this.title});

  @override
  State<WeatherCardCustom> createState() => _WeatherCardCustomState();
}

class _WeatherCardCustomState extends State<WeatherCardCustom> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        constraints: BoxConstraints(
          minHeight: 20.0,
          
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.bodyLarge,),
            Row(
              children: [
                // holder for img
                Container(
                  width: (MediaQuery.of(context).size.width / 3) - 40,
                  child: Image.asset(widget.image,),
                  
                ),
                // etxt detail section
                Container(
                  width: ((MediaQuery.of(context).size.width / 3)*2) - 40,
                  child: Column(
                    children: [
                      Text("details "),
                      Text("Text ")
                    ],
                  ),
                )
              ],
            )
            
          ],
        ),
      ),
    );
  }
}
