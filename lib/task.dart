import 'package:flutter/material.dart';



class TaskElements extends ChangeNotifier {
  List<TaskElements> listOfTasks = [];
  String? title;
  String? description;
  TimeOfDay? taskTime;
  TaskElements({this.title, this.description, this.taskTime});

  void addTask(String title, String description, TimeOfDay selectedTime) {
    listOfTasks.add(TaskElements(
      title: title,
      description: description,
      taskTime: selectedTime,
    ));
    notifyListeners();
  }

  void removeTask(int index) {
    // listOfTasks.remove(listOfTasks.elementAt(index));
    listOfTasks.removeAt(index);
    notifyListeners();
  }
}
