import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:todo_app/features/auth/domain/repository/base_auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  BaseAuthRepo authRepo = AuthRepoImpl();

  Future<void> createUser(String email, String password) async {
    emit(AuthRegisterLoading());
    try {
      var res = await authRepo.createUser(email, password);
      emit(AuthRegisterSuccess(res));
    } catch (e) {
      emit(AuthRegisterSuccess(e.toString()));
    }
  }
}
