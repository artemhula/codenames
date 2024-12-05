import 'dart:developer';

import 'package:codenames/shared/models/room.dart';
import 'package:codenames/shared/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:redux/redux.dart';

final IO.Socket socket = sl();
final SharedPreferences sp = sl();

void socketMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  if (action is ConnectToSocketAction) {
    store.dispatch(const UpdateWebSocketState(status: Status.loading));
    socket.connect();
    socket.onConnect(
      (_) {
        store.dispatch(const UpdateWebSocketState(status: Status.success));
      },
    );
    socket.onError(
      (e) {
        store.dispatch(
          UpdateWebSocketState(
            status: Status.failure,
            errorMessage: e.toString(),
          ),
        );
      },
    );
    socket.on('get-rooms', (data) {
      if (data is List) {
        try {
          log(data.toString());
          final rooms = data
              .map((item) => RoomModel.fromJson(item as Map<String, dynamic>))
              .toList();
          store.dispatch(
              UpdateRoomsListState(rooms: rooms, status: Status.success));
        } catch (e) {
          store.dispatch(
              const UpdateRoomsListState(rooms: [], status: Status.failure));
          log(e.toString());
        }
      }
    });
    socket.emitWithAck(
      'new-user',
      [action.name],
      ack: (data) {
        log('user connected');
        store.dispatch(SaveNicknameAction(nickname: action.name));
      },
    );
    socket.on(
      'get-user-info',
      (data) {
        log('get-user-info: $data');
        if (data is Map<String, dynamic>) {
          try {
            store.dispatch(UpdateUserState(
                user: UserModel.fromJson(data), status: Status.success));
            log('user updated $data');
          } catch (e) {
            store.dispatch(const UpdateUserState(status: Status.failure));
            log(e.toString());
          }
        }
      },
    );
    socket.on(
      'error',
      (e) {
        log('error: ${e['message']}');
        store.dispatch(UpdateWarningState(message: e['message']));
      },
    );
  } else if (action is JoinRoomAction) {
    store.dispatch(const UpdateRoomState(status: Status.loading));
    log('join-room: id - ${store.state.userState.user}');
    socket.emitWithAck(
      'join-room',
      [action.roomId, store.state.userState.user!.id, action.password],
      ack: (Map<String, dynamic> data) {
        if (data['ok'] == true) {
          log('joined');
          socket.off('get-rooms');
          socket.on('finish-game', (data) {
            store.dispatch(UpdateRoomState(
              status: Status.success,
              winnerTeam: data.toString(),
            ));
          });
        } else if (data['statusCode'] == 401) {
          store.dispatch(const UpdateRoomState(status: Status.failure));
        } else {
          store.dispatch(const UpdateRoomState(status: Status.failure));
        }
      },
    );
    socket.on(
      'update-room',
      (room) {
        log(room.toString());
        store.dispatch(UpdateRoomState(
            status: Status.success, room: RoomModel.fromJson(room)));
        for (final user in room['users']) {
          if (user['id'] == store.state.userState.user!.id) {
            store.dispatch(
              UpdateUserState(
                  user: UserModel.fromJson(user), status: Status.success),
            );
          }
        }
      },
    );
  } else if (action is LeaveRoomAction) {
    socket.emitWithAck(
      'leave-room',
      [],
      ack: (data) {},
    );
  } else if (action is JoinTeamAction) {
    socket.emit(
      'join-team',
      [action.team],
    );
  } else if (action is ToggleRoleAction) {
    socket.emit(
      'toggle-role',
      [store.state.userState.user!.id],
    );
  } else if (action is CreateRoomAction) {
    socket.emitWithAck(
      'create-room',
      [action.roomName, action.password, action.language],
      ack: (data) {
        if (data['statusCode'] == 200) {
          log('created');
        }
      },
    );
  } else if (action is StartGameAction) {
    socket.emit('start-game', []);
  } else if (action is ClickCardAction) {
    log('${action.card.word}, ${action.team}');
    socket.emit('card-clicked', [
      action.card.word,
      store.state.userState.user!.id,
    ]);
  } else if (action is ClearRoomStateAction) {
    socket.emitWithAck('leave-room', [], ack: (Map<String, dynamic> data) {
      if (data['statusCode'] == 200) {
        socket.off('update-room');
        socket.off('finish-game');
        store.dispatch(const UpdateRoomState(
            status: Status.initial, room: null, winnerTeam: null));
      }
    });
  } else if (action is DisconnectFromSocketAction) {
    socket.disconnect();
    store.dispatch(const UpdateWebSocketState(status: Status.loading));
  } else if (action is ClearWarningAction) {
    store.dispatch(const UpdateWarningState(message: ''));
  } else if (action is ChangeNicknameAction) {
    socket.emit(
      'change-name',
      [action.nickname, store.state.userState.user!.id],
    );
    store.dispatch(SaveNicknameAction(nickname: action.nickname));
  }
  next(action);
}
