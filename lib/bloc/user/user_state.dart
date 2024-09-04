part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final UserModel user;
  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

final class UserFailure extends UserState {
  final String errorMessage;
  const UserFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
