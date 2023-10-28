import 'package:flutter/material.dart';
import 'package:flutter_bloc_tasks/tasks/tasks_observer.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/tasks_screen.dart';
import 'tasks/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = TasksBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
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
