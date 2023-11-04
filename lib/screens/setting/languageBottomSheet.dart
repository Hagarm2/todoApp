import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/myprovider.dart';

class LanguageButtonSheet extends StatelessWidget {
  const LanguageButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color:  provider.mode == ThemeMode.light
          ? Colors.white
          : Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.changelanguage('en');
              },
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.english,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,

                      color:provider.languagecode == 'en'
                          ? primarycolor
                          : provider.mode==ThemeMode.dark?Colors.white:Colors.black,
                    ),
                  ),
                  Spacer(),
                  provider.languagecode == 'en' ?
                  Icon(
                    Icons.done,
                    color: provider.languagecode == 'en'
                        ? primarycolor
                        : Colors.black,
                    size: 35,
                  )
                       :SizedBox.shrink()
                ],
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: () {
                provider.changelanguage('ar');
              },
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                        color: provider.languagecode == 'en'
                            ? provider.mode==ThemeMode.dark?Colors.white:Colors.black
                            : primarycolor),
                  ),
                  Spacer(),
                  provider.languagecode == 'en' ?
                  SizedBox.shrink()
                   :
                  Icon(
                    Icons.done,
                    size: 35,
                    color: provider.languagecode == 'en'
                        ? Colors.black
                        : primarycolor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
