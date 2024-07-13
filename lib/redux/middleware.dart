import 'package:codenames/models/room.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:redux/redux.dart';

final IO.Socket socket = sl();

void socketMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  if (action is ConnectToSocket) {
    store.dispatch(
        const UpdateWebSocketState(isConnected: false, isLoading: true));

    socket.connect();

    socket.onConnect((_) {
      print('connected');
      store.dispatch(UpdateWebSocketState(isConnected: true, isLoading: false));
    });

    socket.onError((error) {
      store.dispatch(
        UpdateWebSocketState(
          isConnected: false,
          isLoading: false,
          errorMessage: error.toString(),
        ),
      );
    });

    socket.on('get-rooms', (data) {
      if (data is List) {
        try {
          final rooms = data
              .map((item) => RoomModel.fromJson(item as Map<String, dynamic>))
              .toList();
          store.dispatch(UpdateRoomsListState(rooms: rooms));
          print(rooms);
        } catch (e) {
          print(e.toString());
        }
      }
    });
  } else if (action is DisconnectFromSocket) {
    socket.disconnect();
    store.dispatch(UpdateWebSocketState(isConnected: false, isLoading: false));
  }

  next(action);
}
