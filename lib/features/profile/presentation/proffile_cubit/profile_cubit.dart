import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/profile/domain/use_case/sign_out_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileSignOutUseCase profileSignOutUseCase;
  ProfileCubit(this.profileSignOutUseCase) : super(ProfileInitial());

  Future<void>signOut()async{
    emit(ProfileSignOutLoading());

      var res = await profileSignOutUseCase.signOut();
      if (res=="200"){
        emit(ProfileSignOutSuccess());
      }else{
        emit(ProfileSignOutFailure(res));
      }

  }
}
