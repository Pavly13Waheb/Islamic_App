import 'package:flutter/material.dart';
import 'package:islamic/screens/navbarscreens/Ahades.dart';

import '../model/app_color.dart';

class HadethTitle extends StatefulWidget {
  HadethModel hadeth;

  HadethTitle(this.hadeth);

  @override
  State<HadethTitle> createState() => _HadethTitleState();
}

class _HadethTitleState extends State<HadethTitle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Column(
          children: [
            Text(
              widget.hadeth.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color:AppColor.primColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 3,
              color:AppColor.secColor,
            ),
          ],
        ),
      ),
    );
  }
}
