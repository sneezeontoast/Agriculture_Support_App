import '../demo_imports.dart';

class DemoDrawerWidget extends StatelessWidget {
  const DemoDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(height: 40.0,), // Space to push content to visible space
          Text('Menu')
        ],
      ),
    );;
  }
}
