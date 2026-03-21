import 'package:to_do_app/features/home/data/models/todo_param.dart';
import 'package:to_do_app/features/home/domain/repo/base_home_repo.dart';

class CreateTodoUseCase {
  CreateTodoUseCase(this.baseHomeRepo);
  BaseHomeRepo baseHomeRepo ;
  Future<String> createTodo(TodoParam todo){
    return baseHomeRepo.createTodo(todo);
  }
}