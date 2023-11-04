import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/myprovider.dart';
import '../../shared/styles/colors.dart';

class ThemingButtonSheet extends StatelessWidget {
  const ThemingButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color:  provider.mode == ThemeMode.light
          ? Colors.white
          : Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.mode(ThemeMode.dark);
              },
              child: Row(
                children: [
                  Text(
                    "Dark",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                          color: provider.mode == ThemeMode.dark
                              ? Theme.of(context).colorScheme.background
                              : Colors.black,
                        ),
                  ),
                  Spacer(),
                  provider.mode == ThemeMode.dark
                      ? Icon(
                          Icons.done,
                          color: provider.languagecode == 'en'
                              ? primarycolor
                              : Colors.black,
                          size: 35,
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
            SizedBox(height: 10,),

            InkWell(
              onTap: () {
                provider.mode(ThemeMode.light);
              },
              child: Row(
                children: [
                  Text(
                    "Light",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                          color: provider.mode == ThemeMode.light
                              ? Theme.of(context).colorScheme.background
                              : Colors.white,
                        ),
                  ),
                  Spacer(),
                  provider.mode == ThemeMode.dark
                      ? SizedBox.shrink()
                      : Icon(
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
