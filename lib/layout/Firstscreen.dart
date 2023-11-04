import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/setting/setting_tab.dart';
import 'package:todo/screens/tasks/task_tab.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/themdata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/myprovider.dart';
import '../screens/tasks/add_task_bottomsheet.dart';

class First extends StatefulWidget {
  static const String routename = 'First Screen';

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  int index = 0;
  List<Widget>tabs=[TaskTap(),SettingTab()];

  //const First({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      backgroundColor: provider.mode==ThemeMode.light?Color(0xffDFECDB):Color(0xff060E1E),
      extendBody: true,
      appBar: AppBar(
        title: Text("ToDo"),
      ),
      bottomNavigationBar: BottomAppBar(
        shape:CircularNotchedRectangle(),

        notchMargin: 8,
          color:  provider.mode == ThemeMode.light
              ? Colors.white
              : Colors.black,

        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list,size: 30,), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings,size:30 ,), label: ''),
          ],
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: primarycolor,
          unselectedItemColor: Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 3,
          )
        ),
        onPressed: () {
          showSheet();
        },
        child: Icon(Icons.add),
      ),
      body: tabs[index],
    );
  }
  void showSheet(){
    showModalBottomSheet(
      isScrollControlled: true,
        context: context, builder:(context){

      return Padding(

        padding:  EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        child: TaskbottomSheet(),
      );
    }

     );
  }
}
