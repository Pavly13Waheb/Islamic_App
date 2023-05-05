import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/model/app_color.dart';
import 'package:islamic/widgets/hadeth_title.dart';

class Ahadeth extends StatefulWidget {
  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<HadethModel> ahadethModel = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethModel.isEmpty) {
      readAhadethFile();
    }
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Divider(
                thickness: 2,
                color: AppColor.secColor,
              ),
              Text(
                "Ahadeth",
                style: TextStyle(color: AppColor.primColor, fontSize: 25),
              ),
              Divider(
                thickness: 2,
                color: AppColor.secColor,
              ),
              Expanded(
                flex: 2,
                child: Container(color: Colors.red,
                  child: ListView.builder(
                    itemCount: ahadethModel.length,
                    itemBuilder: (context, index) {
                      HadethTitle(ahadethModel[index]);

                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  readAhadethFile() async {
    String fileContent = await rootBundle.loadString("assets/ahadeth.txt");
    List<String> ahadeth = fileContent.split("#\n\r");
    for (int i = 0; 0 < ahadeth.length; i++) {
      List<String> singleHadethLines = ahadeth[i].split("\n");
      String title = singleHadethLines[0];
      singleHadethLines.removeAt(0);
      String content = singleHadethLines.join();
      ahadethModel.add(HadethModel(title: '$title', content: '$content'));
      print(ahadethModel);
    }
    setState(() {});
  }
}

class HadethModel {
  String title;
  String content;
  HadethModel({required this.title, required this.content});
}
