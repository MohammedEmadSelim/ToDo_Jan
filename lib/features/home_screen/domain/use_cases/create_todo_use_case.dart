import 'package:todo_app/features/home_screen/data/models/todo_param.dart';
import 'package:todo_app/features/home_screen/data/repo/home_repo_impl.dart';
import 'package:todo_app/features/home_screen/domain/repo/base_home_repo.dart';

class CreateTodoUseCase {

  BaseHomeRepo homeRepo = HomeRepoImpl();

  Future<String> createTodo(TodoParam todo){
    return homeRepo.createTodo(todo);
  }

}