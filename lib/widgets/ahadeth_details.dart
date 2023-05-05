import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/model/app_color.dart';
import 'package:islamic/screens/navbarscreens/Ahades.dart';

class HadethDetails extends StatefulWidget {
  static String routeName = "Hadeth Details";

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as HadethModel;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColor.primColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          width: double.infinity,
          child: Text(
            "Islam",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: AppColor.primColor,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 130),
        child: Column(
          children: [
            Expanded(
              child: Text(
                arg.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: AppColor.primColor,
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 10),
                  child: Text(
                    arg.content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.primColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  readSuraContent(String fileName) async {
    var suraContent = await rootBundle.loadString("assets/quran/$fileName");
    suraLines = suraContent.split("\n");
    setState(() {});
  }
}
