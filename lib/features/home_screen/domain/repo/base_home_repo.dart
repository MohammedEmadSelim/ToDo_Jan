import 'package:dart_either/dart_either.dart';
import 'package:todo_app/features/home_screen/data/models/todo_model.dart';
import 'package:todo_app/features/home_screen/data/models/todo_param.dart';

abstract class BaseHomeRepo {
  Future<String> createTodo(TodoParam todo);
  Future<Either<String,List<TodoModel>>> getTodos();

}