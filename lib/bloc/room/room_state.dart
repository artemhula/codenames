part of 'room_bloc.dart';

sealed class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

final class RoomInitial extends RoomState {}

final class RoomLoading extends RoomState {}

final class RoomLoaded extends RoomState {
  final RoomModel room;

  const RoomLoaded(this.room);

  @override
  List<Object> get props => [room];
}

final class RoomError extends RoomState {
  final String message;

  const RoomError(this.message);

  @override
  List<Object> get props => [message];
}
