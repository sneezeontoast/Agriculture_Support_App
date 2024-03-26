import 'package:agriculture_support_app/data/home_data.dart';


import '../imports.dart';

const text_1 =
    "Lorem ipsum is a dummy text without any sense. It is a sequence of Latin words that, as they are positioned, do not form sentences with a complete sense, but give life to a test text useful to fill spaces that will subsequently be occupied from ad hoc texts composed by communication professionals. It is certainly the most famous placeholder text even if there are different versions distinguishable from the order in which the Latin words are repeated. Lorem ipsum contains the typefaces more in use, an aspect that allows you to have an overview of the rendering of the text in terms of font choice and font size . When referring to Lorem ipsum, different expressions are used, namely fill text , fictitious text , blind text or placeholder text : in short, its meaning can also be zero, but its usefulness is so clear as to go through the centuries and resist the ironic and modern versions that came with the arrival of the web.";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 150.0,
          backgroundColor: Colors.green,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Agriculture Support App'),
            background: Image.asset(
              'lib/assets/tea.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 15.0),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: (MediaQuery.of(context).size.width / 16) * 10, // Adjust based on your context slider's height
            child: const ContextSlider(), // Assuming this is a widget that can be placed directly
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'To The Agriculture Support App',
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ListVerticalWidget(data_class: HomeStaticData()),
            const Padding(padding: EdgeInsets.all(17.0)),
            const Text(text_1, style: TextStyle(color: Colors.black)),
          ]),
        ),
      ],
    );

  }
}
