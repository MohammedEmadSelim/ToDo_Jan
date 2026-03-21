import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/features/profile/data/data_source/profile_data_source.dart';

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource{
  var user = FirebaseAuth.instance.currentUser;
  @override
  Future<String> signOut()async {
    try{
      await FirebaseAuth.instance.signOut();
      return "200";
    }catch(e){
      return e.toString();
    }
  }
}