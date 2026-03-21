import 'package:dart_either/dart_either.dart';
import 'package:to_do_app/features/home/data/models/todo_param.dart';
import '../../data/models/todo_model.dart';

abstract class BaseHomeRepo {
  Future<String> createTodo (TodoParam todo);
  Future<Either<String, List<TodoModel>>> getTodo();
  Future<String>deleteTodo(String todoId);
  Future<String>editTodo(String todoId,TodoParam todo);
}