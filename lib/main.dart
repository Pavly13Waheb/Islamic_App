import 'package:flutter/material.dart';
import 'package:islamic/screens/homepage.dart';
import 'package:islamic/settings_provider.dart';
import 'package:islamic/widgets/ahadeth_details.dart';
import 'package:islamic/widgets/surah_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/app_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SettingsProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iniSharedPref();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      title: 'Localizations Sample App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate, // Add this line
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(provider.currentLocale),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SurahDetails.routeName: (_) => SurahDetails(),
        HadethDetails.routeName: (_) => HadethDetails()
      },
      initialRoute: HomePage.routeName,
    );
  }

  iniSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("lang") ?? "en";
    String theme = prefs.getString("theme") ?? "light";

    provider.changeLanguage(lang);
    provider.changeTheme(theme == "light" ? ThemeMode.light : ThemeMode.dark);
  }
}
