import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<String> createUser(String email, String password, String name);

  Future<Either<String, User?>> login(String email, String password,
      String name);

  Future<Map<String, String?>?> getUserData();

  Future<String> changePassword(String newPassword);
}
