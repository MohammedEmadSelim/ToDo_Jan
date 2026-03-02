import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/features/profile/domain/use_cases/sign_out_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> signOut() async {
    emit(ProfileSignOutLoading());

    var res = await SignOutUseCase().signOut();

    if (res == "200") {
      emit(ProfileSignOutSuccess());
    } else {
      emit(ProfileSignOutFailure(res));
    }
  }
}
