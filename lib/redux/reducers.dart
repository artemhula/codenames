import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';

AppState appReducer(AppState state, action) => AppState(
      webSocketState: webSocketReducer(state.webSocketState, action),
      roomsListState: roomsListReducer(state.roomsListState, action),
    );

WebSocketState webSocketReducer(WebSocketState state, action) {
  if (action is UpdateWebSocketState) {
    return WebSocketState(
      isConnected: action.isConnected,
      isLoading: action.isLoading,
      errorMessage: action.errorMessage,
    );
  }

  return state;
}

RoomsListState roomsListReducer(RoomsListState state, action) {
  if (action is UpdateRoomsListState) {
    return RoomsListState(rooms: action.rooms);
  }

  return state;
}
