import 'package:todo_app/features/home_screen/data/repo/home_repo_impl.dart';

import '../repo/base_home_repo.dart' show BaseHomeRepo;

class DeleteTodoUseCase {
  BaseHomeRepo homeRepo = HomeRepoImpl();

  Future<String> deleteTodo(String todoId){
    return homeRepo.deleteTodo(todoId);
  }

}