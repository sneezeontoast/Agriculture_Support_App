import '../imports.dart';


class CompostOverveiw extends StatelessWidget {
  const CompostOverveiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How To Make Compost', style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget> [
          Padding(
            padding: EdgeInsets.all(19.0),
            child: Video_Player(video_link: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
          ),


         Padding(padding: EdgeInsets.all(20.0),
              child:
              Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan.', style: Theme.of(context).textTheme.bodyMedium

                // textAlign: TextAlign.center
              )
          ),
          // ConstrainedBox(
          //   constraints: BoxConstraints(
          //       maxHeight: 195,
          //       minHeight: 20,
          //       maxWidth: 5000,
          //       minWidth: 200),
          //   child: Container(
          //     child: Expanded(
          //       child:   SingleChildScrollView(
          //         child: CourseScroll(),
          //     ),
          //     )
          //
          //   ),
          // ),

          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: CourseScroll(),
          // ),

          SizedBox(
            height: 100,
            child: CourseScroll(),
          ),


          ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: 50.0,
                maxWidth: 400,
              ),
            child: Container(
              child: const LinearProgressIndicator(
                value: 0.5,
              ),

            )

          ),

        ],
      ),
    );
  }
}
