import '../imports.dart';
import 'package:agriculture_support_app/data/home_data.dart';


class HowToScreen extends StatelessWidget {
  const HowToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow[20],
        body: Column(
          children: <Widget>[
            const Center(
              child: Text("Here Are Some Tutorials",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.green,
                  //decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: ListVerticalWidget(data_class: HomeStaticData(), screenContext: context,  )),

          ],
        ),
      ),
      
    );
  }
}
