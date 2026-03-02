part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeCreateTodoLoading extends HomeState {}

final class HomeCreateTodoFailure extends HomeState {
  final String message;

  HomeCreateTodoFailure(this.message);
}

final class HomeCreateTodoSuccess extends HomeState {}

// /===================
final class HomeGetTodosLoading extends HomeState {}

final class HomeGetTodosFailure extends HomeState {
  final String message;

  HomeGetTodosFailure(this.message);
}

final class HomeGetTodosSuccess extends HomeState {
  final List<TodoModel> todos;

  HomeGetTodosSuccess(this.todos);
}
// /===================
final class HomeDeleteTodoLoading extends HomeState {}

final class HomeDeleteTodoFailure extends HomeState {
  final String message;

  HomeDeleteTodoFailure(this.message);
}

final class HomeDeleteTodoSuccess extends HomeState {}
