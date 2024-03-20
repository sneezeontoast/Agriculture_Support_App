import '../imports.dart';

class PlaylistButton extends StatelessWidget {
  const PlaylistButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'hello',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String pic = 'lib/assets/button_1.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Button', style: Theme.of(context).textTheme.bodyMedium)
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 340,
          child: Card(
            elevation: 6,
            color: Colors.amber.shade100,
            semanticContainer: true,
            // Implement InkResponse
            child: InkResponse(
              containedInkWell: true,
              highlightShape: BoxShape.rectangle,
              onTap: () {
                setState(() {
                  pic = 'lib/assets/button_2.jpg';
                });
                // Clear all showing snack bars
                ScaffoldMessenger.of(context).clearSnackBars();
                // Display a snack bar
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Let's me sleep. Don't touch me!", style: Theme.of(context).textTheme.bodyMedium),
                ));
              },
              // Add image & text
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Ink.image(
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.cover,
                      image: AssetImage(pic)),
                  const Text(
                    'The Big Boss',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}