import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgExample extends StatelessWidget {
  const SvgExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Show Svg Image"),
      ),
      body:Center(
        child: SvgPicture.asset(
          'assets/img.svg',
        ),
      ) ,
    );
  }
}