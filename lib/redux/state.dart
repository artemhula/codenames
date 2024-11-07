import 'package:codenames/shared/models/room.dart';
import 'package:codenames/shared/models/user.dart';

enum Status {
  initial,
  loading,
  success,
  failure,
}

class AppState {
  const AppState(
      {required this.userState,
      required this.roomsListState,
      required this.webSocketState,
      required this.roomState,
      required this.warningState});

  const AppState.initial({
    this.roomsListState = const RoomsListState.initialState(),
    this.webSocketState = const WebSocketState.initialState(),
    this.userState = const UserState.initialState(),
    this.roomState = const RoomState.initialState(),
    this.warningState = const WarningState.initialState(),
  });

  final RoomsListState roomsListState;
  final WebSocketState webSocketState;
  final UserState userState;
  final RoomState roomState;
  final WarningState warningState;
}

class RoomsListState {
  const RoomsListState({required this.rooms, required this.status});
  const RoomsListState.initialState()
      : rooms = null,
        status = Status.initial;

  final List<RoomModel>? rooms;
  final Status status;
}

class WebSocketState {
  const WebSocketState({
    required this.status,
    required this.errorMessage,
  });

  const WebSocketState.initialState()
      : status = Status.initial,
        errorMessage = '';

  final Status status;
  final String errorMessage;
}

class UserState {
  const UserState({required this.user, required this.status});
  const UserState.initialState()
      : user = null,
        status = Status.initial;

  final UserModel? user;
  final Status status;
}

class RoomState {
  const RoomState(
      {required this.room, required this.status, required this.winnerTeam});
  const RoomState.initialState()
      : room = null,
        status = Status.initial,
        winnerTeam = null;

  final RoomModel? room;
  final Status status;
  final String? winnerTeam;
}

class WarningState {
  const WarningState({required this.message});
  const WarningState.initialState() : message = '';

  final String message;
}
