import 'package:to_do_app/features/home/domain/repo/base_home_repo.dart';

import '../../data/models/todo_param.dart';

class EditTodoUseCase {
  EditTodoUseCase(this.baseHomeRepo);
  BaseHomeRepo baseHomeRepo;
  Future<String>editTodo(String todoId,TodoParam todo){
    return baseHomeRepo.editTodo(todoId, todo);
  }

  }