part of 'home_cubit.dart';

@immutable
sealed class HomeState {}
///////////////createtodo////////////////

final class HomeInitial extends HomeState {}
final class HomeCreateTodoLoading extends HomeState {}
final class HomeCreateTodoSuccess extends HomeState {
}
final class HomeCreateTodoFailure extends HomeState {
  final String message;
  HomeCreateTodoFailure(this.message);
}


///////////////gettodo////////////////

final class HomeGetTodoLoading  extends HomeState {}
final class HomeGetTodoSuccess  extends HomeState {
  final List<TodoModel> todoModel;
  HomeGetTodoSuccess(this.todoModel);
}
final class HomeGetTodoFailure  extends HomeState {
  final String message;
  HomeGetTodoFailure(this.message);
}


///////////////deletetodo////////////////

final class HomeDeleteTodoLoading  extends HomeState {}

final class HomeDeleteTodoSuccess  extends HomeState {}

final class HomeDeleteTodoFailure  extends HomeState {
  final String message;
  HomeDeleteTodoFailure(this.message);
}

///////////////edittodo////////////////

final class HomeEditTodoLoading  extends HomeState {}

final class HomeEditTodoSuccess  extends HomeState {}

final class HomeEditTodoFailure  extends HomeState {
  final String message;
  HomeEditTodoFailure(this.message);
}
