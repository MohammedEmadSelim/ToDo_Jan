import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:to_do_app/features/auth/domain/auth_repository.dart';

class AuthRepoImpl extends AuthRepository{

  AuthRepoImpl(this.authRemoteDataSource);
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<String> createUser(String email, String password,String name) async {
    return authRemoteDataSource.createUser(email, password, name);
  }

  @override
  Future<Either<String, User?>> login(String email, String password,String name) {
    return authRemoteDataSource.login(email, password, name);
  }

  @override
  Future<Map<String, String?>?> getUserData() async {
    return authRemoteDataSource.getUserData();
  }

  @override
  Future<String> changePassword(String newPassword)async{
    return authRemoteDataSource.changePassword(newPassword);
  }

}