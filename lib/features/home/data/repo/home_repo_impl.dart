import 'package:dart_either/dart_either.dart';
import 'package:to_do_app/features/home/data/data_source/home_data_source.dart';
import 'package:to_do_app/features/home/data/models/todo_param.dart';
import 'package:to_do_app/features/home/domain/repo/base_home_repo.dart';

import '../models/todo_model.dart';

class HomeRepoImpl extends BaseHomeRepo{
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl(this.homeRemoteDataSource);

  @override
  Future<String> createTodo(TodoParam todo) {
    return homeRemoteDataSource.createTodo(todo);
  }

  @override
  Future<Either<String, List<TodoModel>>> getTodo() {
   return homeRemoteDataSource.getTodo();
  }

  @override
  Future<String> deleteTodo(String todoId) {
    return homeRemoteDataSource.deleteTodo(todoId);
  }

  @override
  Future<String> editTodo(String todoId,TodoParam todo) {
    return homeRemoteDataSource.editTodo(todoId, todo);
  }

}