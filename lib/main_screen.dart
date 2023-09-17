import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/quran/quranPage.dart';
import 'package:islami/radio/radioPage.dart';
import 'package:islami/sebha/sebhaPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/settingPage.dart';
import 'package:provider/provider.dart';
import 'app_config_provider.dart';
import 'hadeth/hadethPage.dart';

class main_screen extends StatefulWidget {
  static const String routeName = 'main';

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Container(
          child: (provider.appMode == ThemeMode.dark)
              ? Image.asset('assets/imgs/bg.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill)
              : Image.asset('assets/imgs/bg3.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/imgs/moshaf_blue.png')),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/imgs/moshaf.png')),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/imgs/sebha_blue.png')),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/imgs/radio.png')),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
        )
      ],
    );
  }

  List<Widget> tabs = [
    Quran_page(),
    Hadeth_page(),
    Sebha_page(),
    radio_page(),
    setting_page()
  ];
}
