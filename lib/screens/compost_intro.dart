import 'package:agriculture_support_app/data/home_data.dart';
import 'package:agriculture_support_app/data/how_to_data.dart';

import '../imports.dart';

class CompostIntro extends StatelessWidget {
  const CompostIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How To Do Compost'),
      ),
      body: ListView(

        children: <Widget> [
          Padding(
            padding: EdgeInsets.all(19.0),
            child: Video_Player(video_link: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
          ),


          Padding(
              padding: EdgeInsets.only(left: 170.0, right: 19.0),
            child:
              ElevatedButton(
                child: Text('Do a compost course'),
                onPressed: () {
                  Navigator.pushNamed(context, '/course_screen');
                },
              ),

          ),


          Padding(padding: EdgeInsets.all(20.0),
            child:
                Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan.',
                    // textAlign: TextAlign.center
                )
            ),
          // Expanded(child: ListVerticalWidget(data_class: HomeStaticData()))






          // Text('Compost',
          //   style: TextStyle(
          //       fontSize: 18,
          //       height: 2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
          //       color: Colors.redAccent, //font color
          //       backgroundColor: Colors.black12, //background color
          //       letterSpacing: 5, //letter spacing
          //       decoration: TextDecoration.underline, //make underline
          //       decorationStyle: TextDecorationStyle.double, //double underline
          //       decorationColor: Colors.brown, //text decoration 'underline' color
          //       decorationThickness: 1.5, //decoration 'underline' thickness
          //       fontStyle: FontStyle.italic
          //)
          //)
        ],
      ),
    );
  }
}
