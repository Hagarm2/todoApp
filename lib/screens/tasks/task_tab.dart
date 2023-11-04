import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:todo/shared/firebase/firebase_functions.dart';
import 'package:todo/shared/styles/colors.dart';

class TaskTap extends StatefulWidget {
  const TaskTap({super.key});

  @override
  State<TaskTap> createState() => _TaskTapState();
}

class _TaskTapState extends State<TaskTap> {
  DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate:selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) =>
          {
            setState((){
              selectedDate=date;
            })
          },
          leftMargin: 20,
          monthColor: primarycolor,
          dayColor: primarycolor,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: primarycolor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        StreamBuilder(
          stream: FirebaseFunctions.getTasks(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text("Something went wrong"));
            }
            List<TaskModel>task =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return TaskItem(task: task[index]);
              },itemCount: task.length,
              ),
            );
          },
        )
      ],
    );
  }
}
