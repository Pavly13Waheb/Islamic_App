import 'package:flutter/material.dart';
import '../../model/app_color.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {

  var language;
  var mod;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .size
              .height * 0.16, left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.settings, size: 50, color: AppColor.secColor),
          Text(
              textAlign: TextAlign.start,
              "Language",
              style: TextStyle(
                  color: AppColor.primColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          InkWell(
            onTap: () {},
            child:
            Container(
              height: 40,
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 15, vertical: 5),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: AppColor.secColor)),
              child: DropdownButtonHideUnderline(
                  child:
                  DropdownButton(
                    elevation: 0,
                    alignment: Alignment.center,
                    items: ["English", "العربيه"].map((e) =>
                        DropdownMenuItem(value: e,
                          child: Text(e,
                              style: TextStyle(
                                  color: AppColor.primColor,
                                  fontWeight: FontWeight.bold)),
                        ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        language = value;
                      });
                    },
                    value: language,
                  )),
            ),
          ),
          Text(
              textAlign: TextAlign.start,
              "Mod",
              style: TextStyle(
                  color: AppColor.primColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 15, vertical: 5),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: AppColor.secColor)),
              child: DropdownButtonHideUnderline(
                  child:
                  DropdownButton(
                    elevation: 0,
                    alignment: Alignment.center,
                    items: ["Light", "Dark"].map((e) =>
                        DropdownMenuItem(value: e,
                          child: Text(e,
                              style: TextStyle(
                                  color: AppColor.primColor,
                                  fontWeight: FontWeight.bold)),
                        ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        mod = value;
                      });
                    },
                    value: mod,
                  )),
            ),

          ),
        ],
      ),
    );
  }

// getRowOption({required String tx}) {
//   return Column(children: [
//     Container(
//       height: 40,
//       padding: EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
//       margin: EdgeInsets.only(top: 10, bottom: 10),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           border: Border.all(color: AppColor.secColor)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(tx,
//               style: TextStyle(
//                   color: AppColor.primColor,
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold)),
//           Icon(Icons.arrow_drop_down)
//         ],
//       ),
//     ),
//   ]);
// }
}
