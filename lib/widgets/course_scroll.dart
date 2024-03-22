import 'package:agriculture_support_app/imports.dart';

class CourseScroll extends StatefulWidget {

  const CourseScroll({super.key});

  @override
  State<CourseScroll> createState() => _CourseScrollState();
}

class _CourseScrollState extends State<CourseScroll> {

  List progress = [
    {'stage1':true},
    {'stage2':false},
    {'stage3':false},
    // {'stage4':false}, // uncomment if stage4 is added into routes.dart
    // {'stage5':false}, // uncomment if stage5 is added into routes.dart
    // {'stage6':false}, // uncomment if stage6 is added into routes.dart
    // {'stage7':false}, // uncomment if stage7 is added into routes.dart
  ];


  @override
  Widget build(BuildContext context) {
    // for (int i = 0, i <= progress.length; i++)
    print("we should use json");
    return Container( // container cant take const
      width: MediaQuery.of(context).size.width - 16.0, // MediaQuery.of(context).size.width is width of screen and then - 16.0 to add padding
      height: 80.0, // size to fit button
      child: ListView.builder(
        // this tells the list veiw builder howmany items which is the length of progress progress.length is basicly len(progress0

        scrollDirection:  Axis.horizontal,
        itemCount: progress.length,
        itemBuilder: (context, index) { // the builder for the list i think index is illiterating through the list telling what part
          var item = progress[index];
          return Padding(
              padding: const EdgeInsets.all(8.0), // why do you need pading whenthere is already conatiner size
              child: GestureDetector( // detect movement
                onTap: (){ // when tapped
                  // 'stage'+(index+1) is making the elment on the list so stage nd then the button being pressed + 1 because flutter starts from zero

                  // this will see if the list is has been clicked is false the plus one is to make count from one instead of zero then true or false to sting and compares
                  if( progress[index]['stage' + (index+1).toString()] == false){ // false is not capital f like in python
                    progress[index]['stage'+(index+1).toString()] = true;
                    Navigator.pushNamed(context, '/compost_course_stage_'+(index+1).toString());


                  } else {
                    progress[index]['stage'+(index+1).toString()] = false;
                  }
                  setState(() {
                    // not sure what this does is it sometjing to change the state of the button
                    // why isnt the following in here instead
                  });
                },

                // a container that will change colour when clicked
                child: Container(

                  // height: 80.0, // the height of each button
                  // width: 80.0, // the width of each button
                  width: 190.0,
                  height: 90.0,

                  // child: ConstrainedBox(
                  //   child: UnlockButton(myIconUnlocked: item['stage'+(index+1).toString()], title: (index+1).toString()),
                  //
                  //     constraints: BoxConstraints(
                  //       maxWidth: 100,
                  //     )
                  //
                  // )
                  child: UnlockButton(myIconUnlocked: progress[index]['stage'+(index+1).toString()], title: (index+1).toString())
                ),
              ),
          );
        },
      ),
    );
  }
}
