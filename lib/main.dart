// Import my import file which imports everything
// import 'package:google_fonts/google_fonts.dart';

import 'imports.dart';
//import 'demo_imports.dart';
//import 'package:webview_flutter/webview_flutter.dart';

// the reason why there is a gap between video and bottom text is it is in a seperate colum

//import 'package:flutter_inappwebview-master'
// The main function is the starting point for all Flutter app
const String FontNameDefault = 'PT_Serif';

const AppBarTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 20.0, // a good medium text size
  color: Colors.white,
);

const TitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 26.0,
  color: Colors.black,
);

const BodyMediumTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 25.0,
  color: Colors.black,
);

const BodySmallTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 20.0,
  color: Colors.black,
);

const BodyLargeTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 16.0,
  color: Colors.black,
);

const BigGreenTitle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 30,
  color: Colors.green,
);



// const context = Text('Hi This is cool');
void main() {
  return runApp(MyApp());
}

// MyApp is a StatelessWidget which is the root of your application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp is a predefined class in flutter which gives many features like theme, routing etc
    //debugShowCheckedModeBanner: false,
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:
          'Agricultural Support App!', // The title that Android shows for your app
      theme: ThemeData(
        textTheme: TextTheme(
          titleMedium: TitleTextStyle,
          bodySmall: BodySmallTextStyle,
          bodyLarge: BodyLargeTextStyle,
          bodyMedium: BodyMediumTextStyle,
          titleLarge: BigGreenTitle,

        ),
        // appBarTheme: AppBarTheme(
        //
        // ),
        // textTheme: TextTheme(
        //   titleMedium: ,
        //
        // ),
        primarySwatch: Colors.green, // The primary color of your app
        // textTheme: GoogleFonts.emilysCandyTextTheme(),
        // textTheme: GoogleFonts.latoTextTheme(),
        useMaterial3: true,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        // primarySwatch: Colors.green, // The primary color of your app
        primaryColor: Colors.green[850],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green.shade900,
          // brightness: Brightness.,
          // seedColor: Colors.green[800],
        ),
        scaffoldBackgroundColor: Colors.yellow[20],


      ),
      routes: customRoutes, // The widget that will be shown when the app is run
    );
  }
}
