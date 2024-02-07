import 'package:agriculture_support_app/imports.dart';

class UnlockButton extends StatefulWidget {
  const UnlockButton({super.key});

  @override
  State<UnlockButton> createState() => _UnlockButtonState();
}

class _UnlockButtonState extends State<UnlockButton> {

  IconData my_icon = Icons.lock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 100,
                  height: 90,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder()
                    ),
                    child: Stack(
                      children: <Widget> [
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: Icon(
                            my_icon,
                          ),
                        ),
                        Text(
                          'Part 1',
                          style: TextStyle(fontSize: 16),
                        ),

                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        Icon(
                          my_icon = Icons.lock_open,
                        );
                      }
                      );


                    },
                  ),
                )
              ),

            ]
        )
    );


  }
}
