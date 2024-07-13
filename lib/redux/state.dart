import 'package:codenames/models/room.dart';

class AppState {
  const AppState({
    required this.roomsListState,
    required this.webSocketState,
  });

  const AppState.initial({
    this.roomsListState = const RoomsListState.initialState(),
    this.webSocketState = const WebSocketState.initialState(),
  });

  final RoomsListState roomsListState;
  final WebSocketState webSocketState;

  // AppState copyWith({
  //   RoomsListState? roomsListState,
  //   WebSocketState? webSocketState,
  // }) =>
  //     AppState(
  //       roomsListState: roomsListState ?? this.roomsListState,
  //       webSocketState: webSocketState ?? this.webSocketState,
  //     );
}

class RoomsListState {
  const RoomsListState({required this.rooms});
  const RoomsListState.initialState() : rooms = const [];

  final List<RoomModel> rooms;

  // RoomsListState copyWith({List<RoomModel>? rooms}) => RoomsListState(
  //       rooms: rooms ?? this.rooms,
  //     );
}

class WebSocketState {
  const WebSocketState({
    required this.isConnected,
    required this.isLoading,
    required this.errorMessage,
  });

  const WebSocketState.initialState()
      : isConnected = false,
        isLoading = false,
        errorMessage = '';

  final bool isConnected;
  final bool isLoading;
  final String errorMessage;

  // WebSocketState copyWith({
  //   bool? isConnected,
  //   bool? isLoading,
  //   String? errorMessage,
  // }) =>
  //     WebSocketState(
  //       isConnected: isConnected ?? this.isConnected,
  //       isLoading: isLoading ?? this.isLoading,
  //       errorMessage: errorMessage ?? this.errorMessage,
  //     );
}
