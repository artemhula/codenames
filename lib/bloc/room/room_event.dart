part of 'room_bloc.dart';

sealed class RoomEvent extends Equatable {
  const RoomEvent();

  @override
  List<Object> get props => [];
}

final class JoinRoom extends RoomEvent {
  final String roomId;
  final String userId;
  final int password;

  const JoinRoom(this.roomId, this.userId, this.password);

  @override
  List<Object> get props => [roomId, password];
}

final class LeaveRoom extends RoomEvent {}

final class JoinTeam extends RoomEvent {
  final String team;

  const JoinTeam(this.team);

  @override
  List<Object> get props => [team];
}

final class ToggleRole extends RoomEvent {
  final String role;

  const ToggleRole(this.role);

  @override
  List<Object> get props => [role];
}

final class ResetState extends RoomEvent {}