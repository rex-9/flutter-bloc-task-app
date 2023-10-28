part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> tasks;
  const TasksState({this.tasks = const <Task>[]});

  @override
  List<Object> get props => [tasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      tasks: List<Task>.from(
        (map['tasks'] as List<dynamic>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
