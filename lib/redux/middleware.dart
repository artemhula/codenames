import 'dart:developer';
import 'dart:math' as Math;

import 'package:codenames/shared/models/room.dart';
import 'package:codenames/shared/models/user.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:redux/redux.dart';

final IO.Socket socket = sl();

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

    socket.emitWithAck(
      'new-user',
      [
        String.fromCharCodes(
            List.generate(7, (index) => Math.Random().nextInt(33) + 89))
      ],
      ack: (data) {},
    );

    socket.on(
      'get-user-info',
      (data) {
        if (data is Map<String, dynamic>) {
          try {
            store.dispatch(UpdateUserState(
                user: UserModel.fromJson(data), status: Status.success));
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
  } else if (action is GetRoomsAction) {
    store.dispatch(const UpdateRoomsListState(status: Status.loading));
    socket.on('get-rooms', (data) {
      if (data is List) {
        try {
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
  } else if (action is JoinRoomAction) {
    store.dispatch(const UpdateRoomState(status: Status.loading));
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
        store.dispatch(UpdateRoomState(
            status: Status.success, room: RoomModel.fromJson(room)));
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
      [action.role],
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
  }

  next(action);
}
