import 'package:flutter/material.dart';
import 'package:agriculture_support_app/data/home_data.dart';
import '../imports.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  _HomeScreenState2 createState() => _HomeScreenState2();
}

class _HomeScreenState2 extends State<HomeScreen2> {
  var text_1 =
      "Lorem ipsum is a dummy text without any sense. It is a sequence of Latin words that, as they are positioned, do not form sentences with a complete sense, but give life to a test text useful to fill spaces that will subsequently be occupied from ad hoc texts composed by communication professionals. It is certainly the most famous placeholder text even if there are different versions distinguishable from the order in which the Latin words are repeated. Lorem ipsum contains the typefaces more in use, an aspect that allows you to have an overview of the rendering of the text in terms of font choice and font size . When referring to Lorem ipsum, different expressions are used, namely fill text , fictitious text , blind text or placeholder text : in short, its meaning can also be zero, but its usefulness is so clear as to go through the centuries and resist the ironic and modern versions that came with the arrival of the web.";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
          SliverAppBar(
          expandedHeight: 150.0,
          backgroundColor: Colors.green,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              'Agricultural Support App',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Image.asset(
              'lib/assets/tea.png',
              fit: BoxFit.cover,
            ),
          ),
          ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 300,
                      minHeight: 200,
                      maxWidth: 500,
                      minWidth: 200,
                    ),
                    child: Container(
                      child: const ContextSlider(), // contents here
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 1000, // Set the maximum width
                    height: 700, // Set the maximum height
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'To The Agriculture Support App',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.green,
                          ),
                        ),
                        Expanded(
                          child: ListVerticalWidget(
                            data_class: HomeStaticData(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Text(text_1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
