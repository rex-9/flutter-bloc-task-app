import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tasks/models/task.dart';
import 'package:flutter_bloc_tasks/tasks/index.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTaskEvent>(_onAddTaskEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
    on<DeleteTaskEvent>(_onDeleteTaskEvent);
  }

  void _onAddTaskEvent(AddTaskEvent event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(tasks: [...state.tasks, event.task]));
  }

  void _onUpdateTaskEvent(UpdateTaskEvent event, Emitter<TasksState> emit) {}

  void _onDeleteTaskEvent(DeleteTaskEvent event, Emitter<TasksState> emit) {}
}
