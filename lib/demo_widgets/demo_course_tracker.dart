import '../imports.dart';

class DemoCourseTracker extends StatefulWidget {
  const DemoCourseTracker({super.key});

  @override
  State<DemoCourseTracker> createState() => _DemoCourseTrackerState();
}

class _DemoCourseTrackerState extends State<DemoCourseTracker> {

  List progress = [
    {'stage1':false},
    {'stage2':false},
    {'stage3':false},
    {'stage4':false},
    {'stage5':false},
    {'stage6':false},
    {'stage7':false},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 16.0,
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
    itemCount: progress.length, // Length of the data source
    itemBuilder: (context, index) {
    // Convert each item to a ScreenItem just when it's needed for rendering
    var item = progress[index]; // Covert item from raw list item
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          if( progress[index]['stage'+(index+1).toString()] == false){
          progress[index]['stage'+(index+1).toString()] = true;
          } else {
            progress[index]['stage'+(index+1).toString()] = false;
          }
          setState(() {

          });
        },
        child: Container(
          height: 80.0,
          width: 80.0,
          color: item['stage'+(index+1).toString()] == false?Colors.red:Colors.green,
          child: Center(
            child: Text((index+1).toString(), style: TextStyle(fontSize: 30),),
          ),
        ),
      ),
    );
    }),
    );
  }
}
