import 'package:codenames/models/room.dart';
import 'package:codenames/models/user.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:redux/redux.dart';

final IO.Socket socket = sl();

void socketMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) async {
  if (action is ConnectToSocket) {
    store.dispatch(const UpdateWebSocketState(status: Status.loading));

    _connectToSocket(store);

    socket.emitWithAck(
      'new-user',
      ['artem'],
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
            print(e.toString());
          }
        }
      },
    );
  } else if (action is GetRooms) {
    _getRooms(store);
  } else if (action is JoinRoom) {
    // _joinRoom(store, action);
    store.dispatch(const UpdateRoomState(status: Status.loading));
    socket.emitWithAck(
      'join-room',
      [action.roomId, store.state.userState.user!.id, action.password],
      ack: (Map<String, dynamic> data) {
        if (data['statusCode'] == 200) {
          socket.off('get-rooms');
        } else if (data['statusCode'] == 401) {
          store.dispatch(const UpdateRoomState(
              status: Status.failure, message: 'Пароль невірний'));
        } else {
          store.dispatch(const UpdateRoomState(status: Status.failure));
        }
      },
    );
    socket.on(
      'update-room',
      (room) {
        print(room);
        store.dispatch(UpdateRoomState(status: Status.success, room: RoomModel.fromJson(room)));
      },
    );
  } else if (action is LeaveRoom) {
    socket.emitWithAck(
      'leave-room',
      [],
      ack: (data) {
        print(data);
      },
    );
  } else if (action is DisconnectFromSocket) {
    socket.disconnect();
    store.dispatch(const UpdateWebSocketState(status: Status.loading));
  }

  next(action);
}

void _connectToSocket(Store<AppState> store) async {
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
}

void _getRooms(Store<AppState> store) async {
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
        print(e.toString());
      }
    }
  });
}

void _joinRoom(Store<AppState> store, dynamic action) async {}
