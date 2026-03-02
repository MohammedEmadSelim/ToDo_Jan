import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

class ProfileRemoteDataSource {
  var user = FirebaseAuth.instance.currentUser;

  Future<String> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return "200";
    } catch (e) {
      return e.toString();
    }
  }
}
