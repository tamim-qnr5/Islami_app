import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/myTheme.dart';
import 'package:provider/provider.dart';

import '../app_config_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    var provider = Provider.of<AppConfigProvider>(context);
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(
      children: [
        (provider.appMode == ThemeMode.dark)
            ? Image.asset('assets/imgs/bg.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill)
            : Image.asset('assets/imgs/bg3.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill),
        Scaffold(
          appBar: AppBar(
            title: Text('${args.name}',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          body: verses.length == 0
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
              : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width*0.05,
                      vertical: MediaQuery.of(context).size.height*0.06
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color:(provider.appMode == ThemeMode.dark)?Theme.of(context).primaryColor : Colors.white,
                  ),
                  child: ListView.separated(
                    separatorBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child:Divider(
                      color:
                      (provider.appMode == ThemeMode.dark)?
                      MyTheme.yellowColor
                          : Theme.of(context).primaryColor,
                      thickness: 3,
                      ),
                      );
                    },
                    itemBuilder: (context, index) {
                      return Text(
                        '${verses[index]}{${index + 1}}',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      );
                    },
                    itemCount: verses.length,
                  ),
                ),
        )
      ],
    );
  }

  void loadFile(int index) async {
    String content = await rootBundle.loadString('files/quran/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;
  SuraDetailsArgs({required this.index, required this.name});
}
