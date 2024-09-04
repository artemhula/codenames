part of 'room_list_bloc.dart';

sealed class RoomListState extends Equatable {
  const RoomListState();

  @override
  List<Object> get props => [];
}

final class RoomListInitial extends RoomListState {}

final class RoomListLoading extends RoomListState {}

final class RoomListLoaded extends RoomListState {
  final List<RoomModel> rooms;
  const RoomListLoaded(this.rooms);

  @override
  List<Object> get props => [rooms];
}

final class RoomListFailure extends RoomListState {
  final String errorMessage;
  const RoomListFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
