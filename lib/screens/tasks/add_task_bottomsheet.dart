import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/shared/firebase/firebase_functions.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskbottomSheet extends StatefulWidget {
  @override
  State<TaskbottomSheet> createState() => _TaskbottomSheetState();
}

class _TaskbottomSheetState extends State<TaskbottomSheet> {
  //const TaskbottomSheet({super.key});
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selecteddate = DateTime.now();
  var formKy=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: formKy,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.addnewtasks,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: titleController,
              validator:  (value) {
                if(value==null||value.isEmpty){
                  return "Please Enter Task title";
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.tasktitle),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: primarycolor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: primarycolor))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: descriptionController,
              validator:  (value) {
                if(value==null||value.isEmpty){
                  return "Please Enter Task description";
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.taskdescrip),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: primarycolor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: primarycolor))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.selectdat,
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
            ),
            InkWell(
              onTap: () {
                selectDate(context);
              },
              child: Text(
                selecteddate.toString().substring(0, 10),
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.blue),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if(formKy.currentState!.validate()) {
                  TaskModel taskModel = TaskModel(
                      userId: FirebaseAuth.instance.currentUser!.uid,
                      tasktitle: titleController.text,
                      descrip: descriptionController.text,
                      date: DateUtils.dateOnly(selecteddate).millisecondsSinceEpoch);
                  FirebaseFunctions.addTask(
                      taskModel);
                  Navigator.pop(context);
                  /*.then((value){
                    Navigator.pop(context);
                  });*/
                }
              },
                child: Text(AppLocalizations.of(context)!.add),)
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? chooendate = await showDatePicker(
        context: context,
        initialDate: selecteddate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chooendate == null) {
      return;
    } else {
      selecteddate = chooendate;
      setState(() {});
    }
  }
}
