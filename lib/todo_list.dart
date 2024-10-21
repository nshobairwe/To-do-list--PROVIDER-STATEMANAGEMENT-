import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/save_task.dart';

class TododList extends StatelessWidget {
  const TododList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
        Navigator.of(context).pushNamed('/add-todo-screen');
          },
          child: const Icon(Icons.add),),
      body: Consumer<SaveTaks>(
          builder: (context, task, child){
            return ListView.builder(
                itemCount: task.tasks.length,
                itemBuilder: (BuildContext context, index){
                  return ListTile(
                    title: Text(
                        task.tasks[index].title,
                    style: TextStyle(
                      decoration: task.tasks[index].isCompleted ?
                          TextDecoration.lineThrough : TextDecoration.none
                    ),),
                    trailing: Wrap(
                      children:[
                        Checkbox(
                          value: task.tasks[index].isCompleted,
                          onChanged: (_){
                            context.read<SaveTaks>()
                                .checkTasks(index);
                          },
                      ),
                      IconButton(
                          onPressed: (){
                            context.read<SaveTaks>().removeTask(task.tasks[index]);
                          },
                          icon: const Icon(Icons.delete)
                      )]
                    ),
                  );
                });
          })
    );
  }
}
