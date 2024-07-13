import 'package:codenames/models/room.dart';

class UpdateWebSocketState {
  const UpdateWebSocketState(
      {required this.isConnected,
      required this.isLoading,
      this.errorMessage = ''});

  final bool isConnected;
  final bool isLoading;
  final String errorMessage;
}

class UpdateRoomsListState {
  const UpdateRoomsListState({required this.rooms});

  final List<RoomModel> rooms;
}

class ConnectToSocket {}

class DisconnectFromSocket {}
