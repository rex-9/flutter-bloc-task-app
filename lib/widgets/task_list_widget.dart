import 'package:flutter/material.dart';
import 'package:flutter_bloc_tasks/models/task.dart';
import 'package:flutter_bloc_tasks/tasks/index.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: ((context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (value) =>
                  context.read<TasksBloc>().add(UpdateTaskEvent(task: task)),
            ),
            onLongPress: () =>
                context.read<TasksBloc>().add(DeleteTaskEvent(task: task)),
          );
        }),
      ),
    );
  }
}
