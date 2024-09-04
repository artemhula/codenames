import 'package:bloc/bloc.dart';
import 'package:codenames/models/room.dart';
import 'package:equatable/equatable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final IO.Socket _socket;
  RoomBloc(this._socket) : super(RoomInitial()) {
    on<JoinRoom>((event, emit) async {
      emit(RoomLoading());
      _socket.emitWithAck(
        'join-room',
        [event.roomId, event.userId, event.password],
        ack: (Map<String, dynamic> data) {
          if (data['statusCode'] == 200) {
            _socket.off('get-rooms');
          } else if (data['statusCode'] == 401) {
            emit(RoomError('Пароль невірний'));
          } else {
            emit(RoomError('Помилка'));
          }
        },
      );

      _socket.on(
        'update-room',
        (room) {
          print(room);
          emit(RoomLoaded(RoomModel.fromJson(room)));
        },
      );
    });

    on<LeaveRoom>((event, emit) {
      _socket.emitWithAck(
        'leave-room',
        [],
        ack: (data) {
          print(data);
        },
      );
    });

    on<JoinTeam>((event, emit) async{
      _socket.emit(
        'join-team',
        [event.team],
      );
    });

    on<ToggleRole>((event, emit)async {
      _socket.emit(
        'toggle-role',
        [event.role],
      );
    });

    on<ResetState>((event, emit) async {
      emit(RoomInitial());
    });

    // on<CreateRoom>((event, emit) {});
  }
}
