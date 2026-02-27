import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:todo_app/features/auth/domain/repository/base_auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  BaseAuthRepo authRepo = AuthRepoImpl();

  Future<void> createUser(String email, String password, String name) async {
    emit(AuthRegisterLoading());
    try {
      var res = await authRepo.createUser(email, password, name);
      emit(AuthRegisterSuccess(res));
    } catch (e) {
      emit(AuthRegisterSuccess(e.toString()));
    }
  }

  Future<void> login(String email, String password, String name) async {
    emit(AuthLoginLoading());

    var res = await authRepo.login(email, password, name);
    res.fold(
      ifLeft: (e) {
        emit(AuthLoginFailure(e.toString()));
      },
      ifRight: (user) {
        emit(AuthLoginSuccess(user));
      },
    );
  }
}
