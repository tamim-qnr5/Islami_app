import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../app_config_provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'HadethDetailsScreen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as HadethDetailsArgs;
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
          body: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width*0.05,
                      vertical: MediaQuery.of(context).size.height*0.06
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: (provider.appMode == ThemeMode.dark)?Theme.of(context).primaryColor : Colors.white,
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(
                        args.content[index],
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      );
                    },
                    itemCount: args.content.length,
                  ),
                ),
        )
      ],
    );
  }

}

class HadethDetailsArgs {
  String name;
  List<String> content ;
  HadethDetailsArgs({required this.content, required this.name});
}
