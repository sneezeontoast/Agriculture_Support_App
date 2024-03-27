import 'package:flutter/material.dart';
import '../services/font_style_service.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child:Container(
          padding: EdgeInsets.all(10.0),
          constraints: BoxConstraints(
            minHeight: 20.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style:FontStyleService().wcHeader),
              Row(
                children: [
                  // Holder for the image
                  Container(
                    width: (MediaQuery.of(context).size.width / 3) - 40.0,
                    child: Image.asset(widget.image),
                  ),
                  // Text Detail section
                  Container(
                    width: ((MediaQuery.of(context).size.width / 3)*2) - 40.0,
                    child: Column(
                      children: [
                        Text('Details'),
                        Text('Temp')
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        )
      ),
    );
  }
}
