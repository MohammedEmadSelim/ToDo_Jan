import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/auth/data/data_source/remote_data_source.dart';
import 'package:todo_app/features/auth/domain/repository/base_auth_repo.dart';

class AuthRepoImpl extends BaseAuthRepo {
  @override
  Future<String> createUser(String email, String password,String name) async {

      return AuthRemoteDataSource().createUser(email, password,name);

  }

  @override
  Future<Either<String, User?>> login(
      String email,
      String password,
      String name,
      ){
    return AuthRemoteDataSource().login(email, password,name);
  }

}
// create login func in auth repo impl
// use  Either package
// create login func in base repo
// create login func in auth cubit && auth states
// create validation for login
// use bloc consumer handle success navigation and failure snackbar
// ==================================================================
