import 'package:flutter/material.dart';
import 'package:todolist/models/task_model.dart';

class SaveTaks extends ChangeNotifier{

  List<Task> _task = [
    Task(title: "Drink water", isCompleted: false),
    Task(title: "Learn Flutter", isCompleted: false),
    Task(title: "Code with me", isCompleted: false)
  ];

  List<Task> get tasks => _task;

  void addTask(Task task){
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task){
      tasks.remove(task);
      notifyListeners();
  }

  void checkTasks(int index){
    tasks[index].isDone();
    notifyListeners();
  }


}