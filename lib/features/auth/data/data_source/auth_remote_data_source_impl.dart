import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/features/auth/data/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<String> createUser(String email, String password,String name) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      try {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(credential.user!.uid)
            .set({
          "email": email,
          "name": name,
          "id": credential.user!.uid
        });
      } catch (e) {
        print("Firestore Error: $e");
        return "Firestore Error: $e";
      }

      await credential.user?.sendEmailVerification();
      return "200";

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email";
      }
      return e.message ?? "Firebase Auth Error";
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<Either<String, User?>> login(String email, String password,String name) async {
    try{
      final credential = await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: email, password: password);

      if (credential.user ==null){
        return Left("User not Found");
      }
      return Right(credential.user);
    }catch(e){
      return Left(e.toString());
    }

  }

  @override
  Future<Map<String, String?>?> getUserData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final doc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .get();

      if (doc.exists && doc.data() != null) {
        final data = doc.data()!;
        return {
          "name": data['name'],
          "email": data['email'],
          "password": data['password'],
        };
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
  // 🔥 Reset Password Function
  @override
  Future<String> changePassword(String newPassword) async {
    try {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(newPassword);

      return "Password updated successfully";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return "Please login again and try.";
      }
      return e.message ?? "Something went wrong";
    } catch (e) {
      return e.toString();
    }
  }

}