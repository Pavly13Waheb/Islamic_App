import 'package:flutter/material.dart';
import '../../model/app_color.dart';
import '../../model/surah_details_arguments.dart';
import '../../widgets/surah_details.dart';

class SurahList extends StatefulWidget {
  @override
  State<SurahList> createState() => _SurahListState();
}

class _SurahListState extends State<SurahList> {
  List<String> sura = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

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
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Divider(
                thickness: 3,
                color: AppColor.secColor,
              ),
              Text(
                "Surah",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Divider(
                thickness: 3,
                color:AppColor.secColor,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 2, right: 20),
                  itemCount: sura.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SurahDetails.routeName,
                                  arguments: SuraDetailsArgs(
                                    fileName: "${index + 1}.txt",
                                    suraName: sura[index],
                                  ));
                            },
                            child: Text(
                              sura[index],
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Divider(
                            color: AppColor.primColor,
                            indent: 100,
                            endIndent: 100,
                            thickness: 3,
                          )
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
}
