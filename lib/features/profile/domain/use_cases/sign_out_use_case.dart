import 'package:todo_app/features/profile/data/repository/profile_repo_impl.dart';
import 'package:todo_app/features/profile/domain/repository/base_profile_repo.dart';

class SignOutUseCase {

  final BaseProfileRepo profileRepo = ProfileRepoImpl();
  Future<String> signOut(){
    return profileRepo.signOut();
  }
}