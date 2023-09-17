import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/myTheme.dart';
import 'package:provider/provider.dart';

import '../app_config_provider.dart';
import 'Sura_details_screen.dart';

class Sura_name extends StatelessWidget{
  String name;
  int index;

  Sura_name({required this.name,required this.index});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
        arguments: SuraDetailsArgs(index: index, name: name));
      },
      child: Text(
        name,
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