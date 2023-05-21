import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../settings_provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  var mod;

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    var language = provider.currentLocale;
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.16, left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.settings, size: 50, color: AppColor.secColor),
          Text(
              textAlign: TextAlign.start,
              AppLocalizations.of(context)!.language,
              style: TextStyle(
                  color: AppColor.primColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: AppColor.secColor)),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                elevation: 0,
                alignment: Alignment.center,
                items: [
                  DropdownMenuItem(
                    value: "en",
                    child: Text("English",
                        style: Theme.of(context).textTheme.bodyLarge),
                    onTap: () {
                      provider.currentLocale = "en";
                      provider.notifyListeners();
                    },
                  ),
                  DropdownMenuItem(
                    value: "ar",
                    child: Text("العربية",
                        style: Theme.of(context).textTheme.bodyLarge),
                    onTap: () {
                      provider.currentLocale = "ar";
                      provider.notifyListeners();
                    },
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    language = value!;
                  });
                },
                value: language,
              )),
            ),
          ),
          Text(
              textAlign: TextAlign.start,
              AppLocalizations.of(context)!.mod,
              style: TextStyle(
                  color: AppColor.primColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: AppColor.secColor)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  elevation: 0,
                  alignment: Alignment.center,
                  items: [
                    AppLocalizations.of(context)!.light,
                    AppLocalizations.of(context)!.dark
                  ]
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e,
                              style: TextStyle(
                                  color: AppColor.primColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      mod = value;
                    });
                  },
                  value: mod,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
