import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgExample extends StatelessWidget {
  //const SvgExample({Key? key}) : super(key: key);

  String svgString = '<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Show Svg Image"),
      ),
      body: SvgPicture.asset(
            'assets/ear-of-corn-svgrepo-com.svg',
            width: 18.0,
            height: 18.0)


      /*final String assetName = 'assets/image.svg';
      final Widget svg = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Acme Logo'*/
      );
        //child: SvgPicture.asset('assets/ear-of-corn-svgrepo-com.svg')



  }
}

/*
final String assetName = 'assets/image.svg';
final Widget svg = SvgPicture.asset(
    assetName,
    semanticsLabel: 'Acme Logo'
);

String svgString = '<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">'

'<circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />' +
'</svg>')

*/