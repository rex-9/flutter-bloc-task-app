import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tasks/models/task.dart';
import 'package:flutter_bloc_tasks/tasks/bloc/tasks_bloc.dart';
import 'package:flutter_bloc_tasks/tasks/tasks_observer.dart';

import 'screens/tasks_screen.dart';

void main() {
  Bloc.observer = TasksBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TasksBloc()..add(const AddTaskEvent(task: Task(title: 'Task 1'))),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TasksScreen(),
      ),
    );
  }
}
