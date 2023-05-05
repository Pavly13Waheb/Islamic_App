import 'package:flutter/material.dart';
import 'package:islamic/screens/navbarscreens/Ahades.dart';
import 'package:islamic/screens/navbarscreens/sebha.dart';
import '../model/app_color.dart';
import 'navbarscreens/radio.dart';
import 'navbarscreens/surahlist.dart';

class HomePage extends StatefulWidget {
  static String routeName = "homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List navbar = [QuranRadio(), Sebha(), SurahList(), Ahadeth()];
  int navbarpage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text("Islam",
            style: TextStyle(
                color: AppColor.primColor,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
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
            Expanded(flex: 6, child: navbar[navbarpage])
          ],
        ),
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
        ],
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        currentIndex: navbarpage,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColor.primColor,
        onTap: (int index) {
          navbarpage = index;
          setState(() {});
        },
      ),
    );
  }
}
