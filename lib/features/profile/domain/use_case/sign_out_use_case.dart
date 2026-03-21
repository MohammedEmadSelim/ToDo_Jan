import 'package:to_do_app/features/profile/domain/repo/base_repo.dart';

class ProfileSignOutUseCase {
  final BaseProfileRepo baseProfileRepo;
  ProfileSignOutUseCase(this.baseProfileRepo);
  Future<String>signOut(){
    return baseProfileRepo.signOut();
  }
}