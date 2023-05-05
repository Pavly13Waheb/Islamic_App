import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/model/app_color.dart';
import 'package:islamic/widgets/ahadeth_details.dart';

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
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Image(
                    image: AssetImage("assets/ahadeth.png"),
                  ),
                ),
              ),
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
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 2, right: 20),
                  itemCount: ahadethModel.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, HadethDetails.routeName,
                                  arguments: ahadethModel[index]);
                            },
                            child: Text(
                              ahadethModel[index].title,
                              style: TextStyle(
                                fontSize: 25,
                                color: AppColor.primColor,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 3,
                            color: AppColor.secColor,
                            endIndent: 50,
                            indent: 50,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  readAhadethFile() async {
    String hadethFile = await rootBundle.loadString("assets/ahadeth.txt");
    List<String> ahadeth = hadethFile.split("#\r\n");

    for (int i = 0; i < ahadeth.length; i++) {
      List<String> singleHadethLines = ahadeth[i].split("\n");
      String title = singleHadethLines.removeAt(0);
      String content = singleHadethLines.join("\n");
      ahadethModel.add(HadethModel(title: title, content: content));
    }
    setState(() {});
  }
}

class HadethModel {
  String title;
  String content;

  HadethModel({required this.title, required this.content});
}
