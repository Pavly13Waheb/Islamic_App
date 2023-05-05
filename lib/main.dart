import 'package:flutter/material.dart';
import 'package:islamic/screens/homepage.dart';
import 'package:islamic/widgets/surah_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SurahDetails.routeName: (_) => SurahDetails(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
