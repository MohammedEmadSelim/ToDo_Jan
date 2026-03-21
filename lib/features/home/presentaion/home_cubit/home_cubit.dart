import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/home/data/models/todo_model.dart';
import 'package:to_do_app/features/home/data/models/todo_param.dart';
import 'package:to_do_app/features/home/domain/repo/base_home_repo.dart';
import 'package:to_do_app/features/home/domain/use_case/create_todo_use_case.dart';
import 'package:to_do_app/features/home/domain/use_case/delete_todo_use_case.dart';
import 'package:to_do_app/features/home/domain/use_case/edit_todo_use_case.dart';
import 'package:to_do_app/features/home/domain/use_case/get_todo_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.createTodoUseCase, this.getTodoUseCase,this.deleteTodoUseCase,this.editTodoUseCase) : super(HomeInitial());
  final CreateTodoUseCase createTodoUseCase;
  final GetTodoUseCase getTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;
  final EditTodoUseCase editTodoUseCase;

  Future<void> createTodo(TodoParam todo) async {
    emit(HomeCreateTodoLoading());

    var res = await createTodoUseCase.createTodo(todo);
    if (res == "200") {
      emit(HomeCreateTodoSuccess());
    } else {
      emit(HomeCreateTodoFailure(res));
    }
  }


  Future<void> getTodo()async{
    emit(HomeGetTodoLoading());

    var res = await getTodoUseCase.getTodo();

    res.fold(
      ifLeft: (failure) {
        emit(HomeGetTodoFailure(failure));
      },
      ifRight: (todos) {
        emit(HomeGetTodoSuccess(todos));
      },
    );
  }

  Future<void>deleteTodo(String todoId)async{
    emit(HomeDeleteTodoLoading());
    var res = await deleteTodoUseCase.deleteTodo(todoId);
    if (res == "200") {
      emit(HomeDeleteTodoSuccess());
    } else {
      emit(HomeDeleteTodoFailure(res));
    }
  }


  Future<void>editTodo(String todoId,TodoParam todo)async{
    emit(HomeEditTodoLoading());
    var res = await editTodoUseCase.editTodo(todoId,todo);
    if (res == "200") {
      emit(HomeEditTodoSuccess());
    } else {
      emit(HomeEditTodoFailure(res));
    }
  }


}
