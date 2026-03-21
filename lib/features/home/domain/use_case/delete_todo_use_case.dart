import 'package:to_do_app/features/home/data/data_source/home_data_source_impl.dart';
import 'package:to_do_app/features/home/data/repo/home_repo_impl.dart';
import 'package:to_do_app/features/home/domain/repo/base_home_repo.dart';

class DeleteTodoUseCase{
  DeleteTodoUseCase(this.baseHomeRepo);
  BaseHomeRepo baseHomeRepo ;
  Future<String> deleteTodo(String todoId){
    return baseHomeRepo.deleteTodo(todoId);
  }
}