import 'dart:developer';

import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';

AppState appReducer(AppState state, action) => AppState(
      webSocketState: webSocketReducer(state.webSocketState, action),
      roomsListState: roomsListReducer(state.roomsListState, action),
      userState: userReducer(state.userState, action),
      roomState: roomReducer(state.roomState, action),
      warningState: warningReducer(state.warningState, action),
      settingsState: settingsReducer(state.settingsState, action),
    );

WebSocketState webSocketReducer(WebSocketState state, action) {
  if (action is UpdateWebSocketState) {
    return WebSocketState(
      status: action.status,
      errorMessage: action.errorMessage,
    );
  }

  return state;
}

RoomsListState roomsListReducer(RoomsListState state, action) {
  if (action is UpdateRoomsListState) {
    return RoomsListState(rooms: action.rooms, status: action.status);
  }

  return state;
}

UserState userReducer(UserState state, action) {
  if (action is UpdateUserState) {
    log(action.status.toString());
    return UserState(user: action.user, status: action.status);
  }

  return state;
}

RoomState roomReducer(RoomState state, action) {
  if (action is UpdateRoomState) {
    return RoomState(
        room: action.room,
        status: action.status,
        winnerTeam: action.winnerTeam);
  }

  return state;
}

WarningState warningReducer(WarningState state, action) {
  if (action is UpdateWarningState) {
    return WarningState(message: action.message);
  }

  return state;
}

SettingsState settingsReducer(SettingsState state, action) {
  if (action is UpdateSettingsState) {
    return SettingsState(themeMode: action.themeMode, locale: action.locale);
  }

  return state;
}
