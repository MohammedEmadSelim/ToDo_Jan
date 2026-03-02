import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/features/home_screen/data/models/todo_model.dart';
import 'package:todo_app/features/home_screen/data/models/todo_param.dart';
import 'package:todo_app/features/home_screen/domain/use_cases/create_todo_use_case.dart';
import 'package:todo_app/features/home_screen/domain/use_cases/delete_todo.dart';
import 'package:todo_app/features/home_screen/domain/use_cases/get_todo_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> createTodo(TodoParam todo) async {
    emit(HomeCreateTodoLoading());

    var res = await CreateTodoUseCase().createTodo(todo);

    if (res == "200") {
      emit(HomeCreateTodoSuccess());
    } else {
      emit(HomeCreateTodoFailure(res));
    }
  }

  Future<void> getTodo() async {
    emit(HomeGetTodosLoading());

    var res = await GetTodoUseCase().getTodos();

    res.fold(
      ifLeft: (failure) {
        emit(HomeGetTodosFailure(failure));
      },
      ifRight: (todos) {
        emit(HomeGetTodosSuccess(todos));
      },
    );
  }

  Future<void> deleteTodo(String todoId) async {
    emit(HomeDeleteTodoLoading());

    var res = await DeleteTodoUseCase().deleteTodo(todoId);

    if (res == "200") {
      emit(HomeDeleteTodoSuccess());
    } else {
      emit(HomeDeleteTodoFailure(res));
    }
  }
}
