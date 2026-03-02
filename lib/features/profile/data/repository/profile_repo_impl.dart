import 'package:todo_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:todo_app/features/profile/domain/repository/base_profile_repo.dart';

class ProfileRepoImpl extends BaseProfileRepo{

  @override
  Future<String> signOut() {
    return ProfileRemoteDataSource().signOut();
  }
}