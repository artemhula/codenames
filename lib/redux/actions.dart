import 'package:codenames/models/room.dart';
import 'package:codenames/models/user.dart';
import 'package:codenames/redux/state.dart';

class UpdateWebSocketState {
  const UpdateWebSocketState({
    required this.status,
    this.errorMessage = '',
  });

  final Status status;
  final String errorMessage;
}

class UpdateRoomsListState {
  const UpdateRoomsListState({
    this.rooms,
    required this.status,
  });

  final List<RoomModel>? rooms;
  final Status status;
}

class UpdateUserState {
  const UpdateUserState({
    this.user,
    required this.status,
  });

  final UserModel? user;
  final Status status;
}

class UpdateRoomState {
  const UpdateRoomState({
    this.room,
    required this.status,
    this.message,
  });

  final RoomModel? room;
  final Status status;
  final String? message;
}

class ConnectToSocket {}

class DisconnectFromSocket {}

class GetRooms {}

class JoinRoom {
  const JoinRoom({required this.roomId, required this.password});

  final String roomId;
  final int password;
}

class JoinTeam {
  const JoinTeam({required this.team});

  final String team;
}

class LeaveRoom {}
