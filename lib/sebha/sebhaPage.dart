import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myTheme.dart';
import 'package:provider/provider.dart';

import '../app_config_provider.dart';

class Sebha_page extends StatefulWidget {
  @override
  State<Sebha_page> createState() => _Sebha_pageState();
}

class _Sebha_pageState extends State<Sebha_page> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> line = ['سبحان الله','الحمد لله','لا اله الا الله','الله اكبر'] ;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                (provider.appMode == ThemeMode.dark)
                    ?Image.asset('assets/imgs/head of seb7aDArk.png')
                    :Image.asset('assets/imgs/head of seb7a.png'),
                Transform.rotate(angle: angle,
                child:(provider.appMode == ThemeMode.dark)
                ?Image.asset('assets/imgs/body of seb7aDark.png')
                :Image.asset('assets/imgs/body of seb7a.png')),
              ],
            ),
            Text(AppLocalizations.of(context)!.numTasbeh,style: Theme.of(context).textTheme.titleLarge,),
            Container(
              decoration: BoxDecoration(
                color:Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text('$counter',style: Theme.of(context).textTheme.titleMedium,),
              ),
            ),
            InkWell(
              onTap:()
              {
                angle = angle + 1/3;
                counter++;
                if(counter % 33 == 0 && counter > 0)
                  {
                    index++;
                    if(index == line.length)
                      {
                        index = 0;
                      }
                  }
                setState(() {
                });


              },
              child: Container(
                decoration: BoxDecoration(
                    color: (provider.appMode == ThemeMode.dark)
                    ?MyTheme.yellowColor
                    :Theme.of(context).primaryColor,

                    borderRadius: BorderRadius.circular(25)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('${line[index]}',
                    style:(provider.appMode == ThemeMode.dark)
                    ?Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.blackColor)
                    :Theme.of(context).textTheme.titleMedium,),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
