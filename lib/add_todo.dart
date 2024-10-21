import 'package:flutter/material.dart';
import 'package:todolist/models/save_task.dart';
import 'package:provider/provider.dart';
import 'models/task_model.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
          padding: EdgeInsets
              .symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Title'
            ),
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
              onPressed: (){
                context.read<SaveTaks>().addTask(
                  Task(
                      title: controller.text,
                      isCompleted: false)
                );
                controller.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
          )
        ],
      ),),
    );
  }
}
