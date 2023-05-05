import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/model/app_color.dart';
import 'package:islamic/model/surah_details_arguments.dart';

class SurahDetails extends StatefulWidget {
  static String routeName = "sura Details";

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;

    if (suraLines.isEmpty) {
      readSuraContent(arg.fileName);
    }
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
                arg.suraName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: AppColor.primColor,
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: ListView.builder(
                itemCount: suraLines.length,
                itemBuilder: (context, index) {
                  return suraLines.isEmpty
                      ? CircularProgressIndicator()
                      : Text(
                          "(${index + 1}) ${suraLines[index]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColor.primColor,
                          ),
                        );
                },
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
