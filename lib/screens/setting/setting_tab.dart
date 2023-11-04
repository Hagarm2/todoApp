import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/setting/ThemingButtomSheet.dart';
import 'package:todo/screens/setting/languageBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/myprovider.dart';
import '../../shared/styles/colors.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      backgroundColor: provider.mode == ThemeMode.light
          ? Color(0xffDFECDB)
          : Color(0xff060E1E),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.language,
                style: TextStyle(
                    color: provider.mode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  width: double.infinity,
                  height: 57,
                  decoration: BoxDecoration(
                      color: provider.mode == ThemeMode.light
                          ? Colors.white
                          : Colors.black,
                      border: Border.all(color: primarycolor)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          showLanguageBottomSheet();
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              provider.languagecode == 'en'
                                  ? AppLocalizations.of(context)!.english
                                  : AppLocalizations.of(context)!.arabic,
                              style: TextStyle(
                                  color: provider.mode == ThemeMode.light
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        )),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.theming,
                style: TextStyle(
                    color: provider.mode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  height: 57,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: provider.mode == ThemeMode.light
                          ? Colors.white
                          : Colors.black,
                      border: Border.all(color: primarycolor)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          showThemingBottomSheet();
                        },
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                provider.mode == ThemeMode.light
                                    ? AppLocalizations.of(context)!.light
                                    : AppLocalizations.of(context)!.dark,
                                style: TextStyle(
                                    color: provider.mode == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ))),
                  )),
            )
          ],
        ),
      ),
    );
  }

  showLanguageBottomSheet() {
    showModalBottomSheet(

        context: context,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            borderSide: BorderSide(color: Colors.transparent)),
        builder: (context) {
          return LanguageButtonSheet();
        });
  }

  showThemingBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            borderSide: BorderSide(color: Colors.transparent)),
        builder: (context) => ThemingButtonSheet());
  }
}
