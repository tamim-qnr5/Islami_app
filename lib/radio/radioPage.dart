import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myTheme.dart';
import 'package:provider/provider.dart';

import '../app_config_provider.dart';

class radio_page extends StatelessWidget {
  const radio_page({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/imgs/radioImg.png'),
          Text(
            AppLocalizations.of(context)!.quranRadio,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    color: (provider.appMode == ThemeMode.dark)
                        ? MyTheme.yellowColor
                        : Theme.of(context).primaryColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.play_arrow_solid,
                    color: (provider.appMode == ThemeMode.dark)
                        ? MyTheme.yellowColor
                        : Theme.of(context).primaryColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    color: (provider.appMode == ThemeMode.dark)
                        ? MyTheme.yellowColor
                        : Theme.of(context).primaryColor,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
