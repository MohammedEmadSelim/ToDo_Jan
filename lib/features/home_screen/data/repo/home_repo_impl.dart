import 'package:dart_either/dart_either.dart';
import 'package:todo_app/features/home_screen/data/data_source/home_data_source.dart';
import 'package:todo_app/features/home_screen/data/models/todo_model.dart';
import 'package:todo_app/features/home_screen/data/models/todo_param.dart';
import 'package:todo_app/features/home_screen/domain/repo/base_home_repo.dart';

class HomeRepoImpl extends BaseHomeRepo {

  @override
  Future<String> createTodo(TodoParam todo) {
   return HomeRemoteDataSource().createTodo(todo);
  }

  @override
  Future<Either<String,List<TodoModel>>>getTodos() {
    return HomeRemoteDataSource().getTodos();

  }
}