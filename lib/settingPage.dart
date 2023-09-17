import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'LangBottomSheet.dart';
import 'ThemeBottomSheet.dart';
import 'app_config_provider.dart';
class setting_page extends StatefulWidget {
  const setting_page({super.key});

  @override
  State<setting_page> createState() => _setting_pageState();
}

class _setting_pageState extends State<setting_page> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              showLangBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                  (provider.appLang == 'ar')
                      ?AppLocalizations.of(context)!.arabic
                      :AppLocalizations.of(context)!.english,

                    style: Theme.of(context).textTheme.titleSmall,),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (provider.appMode == ThemeMode.dark)
                        ?AppLocalizations.of(context)!.dark
                        :AppLocalizations.of(context)!.light,

                    style: Theme.of(context).textTheme.titleSmall,),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          )
          
        ],
      ),
    );
  }

  void showLangBottomSheet()
  {
    showModalBottomSheet(
        context: context,
        builder: (context) => LangBottomSheet()
    );
  }

  void showThemeBottomSheet()
  {
    showModalBottomSheet(
        context: context,
        builder: (context) => ThemeBottomSheet()
    );
  }
}

