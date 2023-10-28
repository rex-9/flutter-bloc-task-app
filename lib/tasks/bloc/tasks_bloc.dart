import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tasks/models/task.dart';
import 'package:flutter_bloc_tasks/tasks/index.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTaskEvent>(_onAddTaskEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
    on<DeleteTaskEvent>(_onDeleteTaskEvent);
  }

  void _onAddTaskEvent(AddTaskEvent event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(tasks: [...state.tasks, event.task]));
  }

  void _onUpdateTaskEvent(UpdateTaskEvent event, Emitter<TasksState> emit) {
    final state = this.state;
    final eventTask = event.task;
    final updatedTask = eventTask.copyWith(isDone: !eventTask.isDone);
    final updatedTasks = state.tasks
        .map((task) => task.id == event.task.id ? updatedTask : task)
        .toList();
    emit(
      TasksState(
        tasks: updatedTasks,
      ),
    );
  }

  void _onDeleteTaskEvent(DeleteTaskEvent event, Emitter<TasksState> emit) {
    final state = this.state;
    final updatedTasks =
        state.tasks.where((task) => task.id != event.task.id).toList();
    emit(
      TasksState(
        tasks: updatedTasks,
      ),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
