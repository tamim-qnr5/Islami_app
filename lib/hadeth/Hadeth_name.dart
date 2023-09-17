import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_config_provider.dart';
import 'Hadeth_details_screen.dart';
import 'hadethPage.dart';

class Hadeth_name extends StatelessWidget{
  Hadeth hadeth;

  Hadeth_name({
    required this.hadeth
  });
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
        arguments: HadethDetailsArgs(name: hadeth.title,content: hadeth.content));
      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,
        style:
        (provider.appMode == ThemeMode.dark)?
        Theme.of(context).textTheme.titleMedium
            :
        Theme.of(context).textTheme.titleSmall,
        ),
    );

  }

}