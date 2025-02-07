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

void socketMiddleware(Store<AppState> store, action, NextDispatcher next) async {
  if (action is ConnectToSocketAction) {
    store.dispatch(const UpdateWebSocketState(status: Status.loading));
    store.dispatch(const UpdateUserState(status: Status.loading));
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
          final rooms = data.reversed
              .where((item) => !(item as Map<String, dynamic>)['isGameFinished'])
              .map((item) => RoomModel.fromJson(item as Map<String, dynamic>))
              .toList();
          store.dispatch(UpdateRoomsListState(rooms: rooms, status: Status.success));
        } catch (e) {
          store.dispatch(const UpdateRoomsListState(rooms: [], status: Status.failure));
        }
      }
    });
    socket.emitWithAck(
      'new-user',
      [action.name],
      ack: (data) {
        store.dispatch(SaveNicknameAction(nickname: action.name));
      },
    );
    socket.on(
      'get-user-info',
      (data) {
        if (data is Map<String, dynamic>) {
          try {
            store.dispatch(UpdateUserState(user: UserModel.fromJson(data), status: Status.success));
          } catch (e) {
            store.dispatch(const UpdateUserState(status: Status.failure));
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
    socket.on(
      'update-room',
      (room) {
        store.dispatch(UpdateRoomState(status: Status.success, room: RoomModel.fromJson(room)));
        for (final user in room['users']) {
          if (user['id'] == store.state.userState.user!.id) {
            store.dispatch(
              UpdateUserState(user: UserModel.fromJson(user), status: Status.success),
            );
          }
        }
      },
    );
    socket.on('finish-game', (data) {
      log('finish-game - ${data.toString()}');
      store.dispatch(UpdateRoomState(
        status: Status.success,
        winnerTeam: data.toString(),
      ));
    });
  } else if (action is JoinRoomAction) {
    store.dispatch(const UpdateRoomState(status: Status.loading));
    socket.emitWithAck(
      'join-room',
      [action.roomId, action.password],
      ack: (Map<String, dynamic> data) {
        if (data['ok'] == true) {
        } else if (data['statusCode'] == 401) {
          store.dispatch(const UpdateRoomState(status: Status.failure));
        } else {
          store.dispatch(const UpdateRoomState(status: Status.failure));
        }
      },
    );
  } else if (action is LeaveRoomAction) {
    socket.emitWithAck(
      'leave-room',
      [],
      ack: (data) {
        store.dispatch(ClearRoomStateAction());
      },
    );
  } else if (action is JoinTeamAction) {
    socket.emit('join-team', [action.team]);
  } else if (action is ToggleRoleAction) {
    socket.emit('toggle-role', [action.futureRole]);
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
    socket.emit('start-game', [store.state.roomState.room!.id]);
  } else if (action is ClickCardAction) {
    log('${action.card.word}, ${action.team}');
    socket.emit('card-clicked', [action.card.word]);
  } else if (action is ClearRoomStateAction) {
    store.dispatch(const UpdateRoomState(status: Status.initial, room: null, winnerTeam: null));
  } else if (action is DisconnectFromSocketAction) {
    socket.disconnect();
    store.dispatch(const UpdateWebSocketState(status: Status.loading));
  } else if (action is ClearWarningAction) {
    store.dispatch(const UpdateWarningState(message: null));
  } else if (action is ChangeNicknameAction) {
    store.dispatch(UpdateUserState(status: Status.loading, user: store.state.userState.user));
    socket.emitWithAck(
      'change-name',
      [action.nickname],
      ack: (data) {
        if (data['ok'] == true) {
          store.dispatch(SaveNicknameAction(nickname: action.nickname));
          store.dispatch(const UpdateWarningState(message: 'Nickname was changed'));
        }
      },
    );
  }
  next(action);
}
