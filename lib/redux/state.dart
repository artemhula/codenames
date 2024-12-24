import 'package:codenames/shared/models/room.dart';
import 'package:codenames/shared/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum Status {
  initial,
  loading,
  success,
  failure,
}

class AppState {
  const AppState({
    required this.userState,
    required this.roomsListState,
    required this.webSocketState,
    required this.roomState,
    required this.warningState,
    required this.settingsState,
  });

  const AppState.initial({
    this.roomsListState = const RoomsListState.initialState(),
    this.webSocketState = const WebSocketState.initialState(),
    this.userState = const UserState.initialState(),
    this.roomState = const RoomState.initialState(),
    this.warningState = const WarningState.initialState(),
    this.settingsState = const SettingsState.initialState(),
  });

  final RoomsListState roomsListState;
  final WebSocketState webSocketState;
  final UserState userState;
  final RoomState roomState;
  final WarningState warningState;
  final SettingsState settingsState;
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

class WarningState extends Equatable {
  const WarningState({required this.message});
  const WarningState.initialState(): message = null;

  final String? message;
  
  @override
  List<Object?> get props => [message];
}

class SettingsState {
  const SettingsState(
      {required this.themeMode,
      required this.soundOn,
      required this.vibrationOn,
      this.locale});
  const SettingsState.initialState()
      : themeMode = ThemeMode.light,
        locale = null,
        soundOn = true,
        vibrationOn = true;

  final ThemeMode themeMode;
  final Locale? locale;
  final bool soundOn;
  final bool vibrationOn;
}
