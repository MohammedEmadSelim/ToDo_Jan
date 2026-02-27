import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  Future<String> createUser(String email, String password, String name) async {
    print("createUser fun started");
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
            //create user info in firestore
            FirebaseFirestore.instance
                .collection('users')
                .doc(value.user!.uid)
                .set({"email": email, "name": name, "id": value.user!.uid});
          });
      // verify user email
      credential.user?.sendEmailVerification();

      return "200";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return e.message ?? "FireError";
    } catch (e) {
      print(e);

      return e.toString();
    }
  }

  Future<Either<String, User?>> login(
    String email,
    String password,
    String name,
  ) async {
    print("createUser fun started");
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(credential.user);
    } catch (e) {
      print(e);

      return Left(e.toString());
    }
  }
}
