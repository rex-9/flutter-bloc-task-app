import 'package:flutter/material.dart';
import 'package:flutter_bloc_tasks/models/task.dart';
import 'package:flutter_bloc_tasks/tasks/index.dart';
import 'package:flutter_bloc_tasks/widgets/task_list_widget.dart';

import '../widgets/add_task_modal_widget.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  void _addTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AddTaskModalWidget(),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(
              label: Text(
                'Tasks:',
              ),
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              final List<Task> tasks = state.tasks;
              return TaskListWidget(tasks: tasks);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTaskModal(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
