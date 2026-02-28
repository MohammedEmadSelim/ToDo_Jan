import 'package:dart_either/dart_either.dart';
import 'package:todo_app/features/home_screen/data/models/todo_model.dart';
import 'package:todo_app/features/home_screen/data/repo/home_repo_impl.dart';
import 'package:todo_app/features/home_screen/domain/repo/base_home_repo.dart';

class GetTodoUseCase {
  BaseHomeRepo homeRepo = HomeRepoImpl();

  Future<Either<String, List<TodoModel>>> getTodos() {
    return homeRepo.getTodos();
  }
}
