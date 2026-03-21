part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileSignOutLoading extends ProfileState {}
final class ProfileSignOutSuccess extends ProfileState {
}
final class ProfileSignOutFailure extends ProfileState{
  final String message;
  ProfileSignOutFailure(this.message);
}