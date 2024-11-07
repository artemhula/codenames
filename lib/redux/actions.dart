import 'package:codenames/shared/models/card.dart';
import 'package:codenames/shared/models/room.dart';
import 'package:codenames/shared/models/user.dart';
import 'package:codenames/redux/state.dart';

class UpdateWebSocketState{
  const UpdateWebSocketState({
    required this.status,
    this.errorMessage = '',
  });

  final Status status;
  final String errorMessage;
}

class UpdateRoomsListState{
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
    this.winnerTeam,
  });

  final RoomModel? room;
  final Status status;
  final String? winnerTeam;
}

class UpdateWarningState {
  const UpdateWarningState({
    required this.message,
  });

  final String message;
}

class ConnectToSocketAction {}

class DisconnectFromSocketAction {}

class GetRoomsAction {}

class JoinRoomAction {
  const JoinRoomAction({required this.roomId, required this.password});

  final String roomId;
  final int password;
}

class JoinTeamAction {
  const JoinTeamAction({required this.team});

  final String team;
}

class ToggleRoleAction {
  const ToggleRoleAction(this.role);

  final String role;
}

class LeaveRoomAction {}

class CreateRoomAction {
  const CreateRoomAction({
    required this.roomName,
    required this.password,
    required this.language,
  });

  final String roomName;
  final int password;
  final String language;
}

class StartGameAction {}

class ClickCardAction {
  const ClickCardAction(this.card, this.team);

  final CardModel card;
  final String team;
}
