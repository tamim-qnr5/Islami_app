import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/quran/Sura_name.dart';
import 'package:provider/provider.dart';

import '../app_config_provider.dart';
import '../myTheme.dart';
import 'Hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Hadeth_page extends StatefulWidget {
  @override
  State<Hadeth_page> createState() => _Hadeth_pageState();
}

class _Hadeth_pageState extends State<Hadeth_page> {
  List<Hadeth> HadethLIst = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (HadethLIst.length == 0) {
      loadhadeth();
    }

    return Column(
      children: [
        Center(child: Image.asset('assets/imgs/hadethLogo.png')),
        Divider(
          color: (provider.appMode == ThemeMode.dark)
              ? MyTheme.yellowColor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadethName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Divider(
          color: (provider.appMode == ThemeMode.dark)
              ? MyTheme.yellowColor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Expanded(
          child: (HadethLIst.isEmpty)
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: (provider.appMode == ThemeMode.dark)
                          ? MyTheme.yellowColor
                          : Theme.of(context).primaryColor,
                      thickness: 3,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Hadeth_name(
                      hadeth: HadethLIst[index],
                    );
                  },
                  itemCount: HadethLIst.length,
                ),
        )
      ],
    );
  }

  void loadhadeth() async {
    String content = await rootBundle.loadString('files/hadeth/ahadeth.txt');
    List<String> hadethList = content.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(content: hadethLines, title: title);
      HadethLIst.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;
  Hadeth({required this.content, required this.title});
}
