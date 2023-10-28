import 'package:flutter/material.dart';
import 'package:flutter_bloc_tasks/services/guid_gen.dart';
import 'package:flutter_bloc_tasks/tasks/index.dart';

import '../models/task.dart';

class AddTaskModalWidget extends StatelessWidget {
  AddTaskModalWidget({
    super.key,
  });

  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Add a new Task',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text("New Task"),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  final task = Task(
                    id: GUIDGen.generate(),
                    title: titleController.text,
                  );
                  context.read<TasksBloc>().add(AddTaskEvent(task: task));
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              )
            ],
          )
        ],
      ),
    );
  }
}
