import 'package:agriculture_support_app/imports.dart';

class UnlockButton extends StatefulWidget {
  final bool myIconUnlocked;
  final String title;

  // final my_icon_unlocked;
  const UnlockButton({super.key, required this.myIconUnlocked, required this.title});
  // const UnlockButton({Key? key, required this.my_icon}) : super(key: key);

  @override
  State<UnlockButton> createState() => _UnlockButtonState();
}

class _UnlockButtonState extends State<UnlockButton> {

  var myIcon = Icon(Icons.lock);

  @override
  Widget build(BuildContext context) {
    // print(("widget.myIconUnlocked: ", widget.myIconUnlocked));
    // print(("widget.title: ", widget.title));
    return
      Card(
        // style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder()),
        child: Stack(
          children: <Widget>[
            SizedBox(
                width: 90,
                height: 90,
                child: widget.myIconUnlocked
                    ? myIcon = Icon(Icons.lock_open) // ask chris why this didnt work
                    : myIcon = Icon(Icons.lock)),

            Text(
              "stage " + widget.title,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        // onPressed: () {
        //   setState(() {
        //
        //   });
        // },
        // onPressed: () {
        //   setState(() {
        //     Icon(
        //       widget.my_icon = Icons.lock_open,
        //     );
        //   }
        //   );
        //
        //
        // },
    );

  }
}
