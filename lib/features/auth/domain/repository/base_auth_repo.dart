import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuthRepo{
  Future<String> createUser(String email, String password,String name) ;
  Future<Either<String, User?>> login(
      String email,
      String password,
      String name,
      );
}