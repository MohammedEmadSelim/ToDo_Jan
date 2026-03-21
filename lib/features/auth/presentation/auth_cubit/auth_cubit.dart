import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/auth/domain/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  AuthRepository authRepo;

  Future<void> createUser(String email, String password, String name) async {
    emit(AuthRegisterLoading());
    try {
      var res = await authRepo.createUser(email, password, name);
      emit(AuthRegisterSuccess(res));
    } catch (e) {
      emit(AuthRegisterError(e.toString()));
    }
  }

  Future<void> login(String email, String password, String name) async {
    emit(AuthSignInLoading());

    try {
      var res = await authRepo.login(email, password, name);

      res.fold(
        ifLeft: (e) {
          print("Login Error: $e");
          emit(AuthSignInError(e.toString()));
        },
        ifRight: (user) {
          emit(AuthSignInSuccess(user));
        },
      );
    } catch (e) {
      print("Unexpected Error: $e");
      emit(AuthSignInError(e.toString()));
    }
  }

  Future<void> getUserData() async {
    emit(AuthGetUserDataLoading());

    try {
      final data = await authRepo.getUserData();

      if (data != null) {
        emit(AuthGetUserDataSuccess(
          name: data['name'],
          email: data['email'],
          password: data['password'],
        ));
      } else {
        emit(AuthGetUserDataError("User data not found"));
      }

    } catch (e) {
      emit(AuthGetUserDataError(e.toString()));
    }
  }

  Future<void> changePassword(String password, String confirmPassword) async {
    if (password != confirmPassword) {
      emit(AuthChangePasswordError("Passwords do not match"));
      return;
    }

    emit(AuthChangePasswordLoading());

    final result = await authRepo.changePassword(password);

    if (result == "Password updated successfully") {
      emit(AuthChangePasswordSuccess());
    } else {
      emit(AuthChangePasswordError(result));
    }
  }
}
