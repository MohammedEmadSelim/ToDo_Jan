import 'package:to_do_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:to_do_app/features/profile/domain/repo/base_repo.dart';

class ProfileRepoImpl extends BaseProfileRepo{
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepoImpl(this.profileRemoteDataSource);
  @override
  Future<String> signOut() {
    return profileRemoteDataSource.signOut();
  }
}