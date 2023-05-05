import 'package:flutter/material.dart';

import '../../model/app_color.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  List prayrsTextList = ["God", "Praise God", "1=1", "2=2", ""];
  int prays = 0;
  int pray = 0;
  String? prayText;

  double turns = 0;
  String sebhaImage = "assets/body of seb7a.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.only(top: 40),
            child: Image(
              image: AssetImage("assets/quran.png"),
            ),
          ),
        ),
        Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image(
                    image: AssetImage("assets/head of seb7a.png"),
                    width: 50,
                    height: 50),
                Container(
                  padding: EdgeInsets.only(top: 35),
                  child: AnimatedRotation(
                    turns: turns,
                    duration: Duration.zero,
                    child: Image(
                      image: AssetImage(sebhaImage),
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: const Text(
              "The number of praises",
              style: TextStyle(fontSize: 25),
            )),
        Container(
          decoration: BoxDecoration(
              color:AppColor.secColor,
              borderRadius: BorderRadius.circular(10)),
          width: 50,
          height: 60,
          alignment: Alignment.center,
          child: Text("$prays", style: const TextStyle(fontSize: 25)),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:  MaterialStatePropertyAll(
              AppColor.secColor,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side:  BorderSide(
                  color:AppColor.secColor,
                ),
              ),
            ),
          ),
          onPressed: () {
            prayerCount();
            changeRotation(sebhaImage);
            setState(() {});
          },
          child: Text(
            prayrsTextList[pray],
            style:  TextStyle(
              fontSize: 25,
              color:AppColor.secColor,
            ),
          ),
        ),
      ],
    );
  }

  prayerCount() {
    if (pray != prayrsTextList.length) {
      prays++;
      if (prays % 33 == 0) {
        pray++;
        prayText = prayrsTextList[pray];

        if (pray == 4) {
          pray = 0;
        }
      }
    }
  }

  changeRotation(String image) {
    setState(() => turns += 0.50 / 30.0);
  }
}
