import 'package:flutter/material.dart';
import 'package:islami/myTheme.dart';

import 'app_config_provider.dart';
import 'hadeth/Hadeth_details_screen.dart';
import 'quran/Sura_details_screen.dart';
import 'main_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(

      create: (BuildContext context) => AppConfigProvider() ,
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      home: main_screen(),
      debugShowCheckedModeBanner: false,
      routes: {
        main_screen.routeName : (context) => main_screen(),
        SuraDetailsScreen.routeName : (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName : (context) => HadethDetailsScreen()

      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      locale:Locale(provider.appLang),
      themeMode: provider.appMode,


    );
  }
}

