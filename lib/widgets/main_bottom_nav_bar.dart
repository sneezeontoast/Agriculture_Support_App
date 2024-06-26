


import '../imports.dart';

class BottomMainNavBar extends StatefulWidget {
  var screenContext;
  BottomMainNavBar({super.key, required this.screenContext});

  @override
  State<BottomMainNavBar> createState() => _BottomMainNavBarState();
}

class _BottomMainNavBarState extends State<BottomMainNavBar> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    HowToScreen(),
    Text("Tools"),
    // GetWeatherDataType(),
    // GetWeatherText(long_or_quick_l_or_q: 't', day: widget.weather[0]['day'],),
    // Text([0.2, 1.7, 2.9].toString()), // findWeather((100, 100, 100, 100))
    // Text('${getWeatherData().toString()} '),
    // Text("Add The weather forecast here we maybe should change the icon to the current weather"),
    WeatherScreen(),
    Text("Info")

    // Text("information this might not be needed")

  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.green, Theme.of(context).primaryColor]),
          ),
        ),

        actions: <Widget> [
          // Padding(
            // child: DropdownButton(
          // items: const [
          //   DropdownMenuItem(child: Text("click here 1"), value: "click here 1",)
          // ],
          // onChanged: onChanged
          // ),
          const Padding(
            child: Icon(
              Icons.menu,
                color: Colors.white,
            ),
              padding: EdgeInsets.all(16))

        ],

        title: const Text(
          "Agriculture Suport App ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),




      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Theme.of(context).primaryColor, Colors.green]),

          color: Theme.of(context).primaryColor, // make the nav bar the themed colour of the app
          borderRadius: const BorderRadius.only(
            // make nav bar have smooth corners
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // make to the space it is
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                  ? const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 35,
                  )
                  : const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 35,

                  ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.find_in_page,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.find_in_page_outlined,
                color: Colors.white,
                size: 35,

              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                Icons.construction,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.construction_rounded,
                color: Colors.white,
                size: 35,

              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const Icon(
                Icons.thunderstorm,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.thunderstorm_outlined,
                color: Colors.white,
                size: 35,

              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 4;
                });
              },
              icon: pageIndex == 4
                  ? const Icon(
                Icons.info,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 35,

              ),
            ),
          ],
        ),
      ),

    );
  }
}
