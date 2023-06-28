import 'package:flutter/material.dart';
import 'package:islamic/screens/navbarscreens/Ahades.dart';
import 'package:islamic/screens/navbarscreens/sebha.dart';
import 'package:islamic/screens/navbarscreens/settings_tab.dart';
import '../model/app_color.dart';
import 'navbarscreens/radio.dart';
import 'navbarscreens/surahlist.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  static String routeName = "homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List navbar = [QuranRadio(), Sebha(), SurahList(), Ahadeth(), SettingsTab()];
  int navbarpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.islami,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: navbar[navbarpage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/radio.png", height: 30),
            label: 'Radio',
            backgroundColor: AppColor.secColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/sebha_blue.png", height: 30),
            label: 'Sebha',
            backgroundColor: AppColor.secColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/quranpages.png", height: 30),
            label: 'Surahs',
            backgroundColor: AppColor.secColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/quranico.png", height: 30),
            label: 'Ahades',
            backgroundColor: AppColor.secColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
              color: AppColor.primColor,
            ),
            label: AppLocalizations.of(context)!.setting,
            backgroundColor: AppColor.primColorDark,
          ),
        ],
        currentIndex: navbarpage,
        onTap: (int index) {
          navbarpage = index;
          setState(() {});
        },
      ),
    );
  }
}
