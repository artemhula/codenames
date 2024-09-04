import 'package:bloc/bloc.dart';
import 'package:codenames/models/room.dart';
import 'package:equatable/equatable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'room_list_event.dart';
part 'room_list_state.dart';

class RoomListBloc extends Bloc<RoomListEvent, RoomListState> {
  final IO.Socket _socket;

  RoomListBloc(this._socket) : super(RoomListInitial()) {
    on<GetRoomList>((event, emit) async {
      _socket.on('get-rooms', (dynamic data) {
        if (data is List) {
          try {
            print(data);
            final rooms = data
                .map((item) => RoomModel.fromJson(item as Map<String, dynamic>))
                .toList();
            emit(RoomListLoaded(rooms));
          } catch (e) {
            emit(RoomListFailure(e.toString()));
            print(e.toString());
          }
        }
      });
    });
  }
}
