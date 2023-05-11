import 'package:flutter/cupertino.dart';

class QuranRadio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 70),
            child: Image(
              image: AssetImage("assets/quran.png"),
            ),
          ),
          Image(
            image: AssetImage("assets/radio.png"),
            width: 100,
          height: 100,
        ),
      ],
    );
  }
}
