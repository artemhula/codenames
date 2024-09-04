import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'socket_event.dart';
part 'socket_state.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  final IO.Socket _socket;

  SocketBloc(this._socket) : super(SocketInitial()) {
    on<Connect>((event, emit) async {
      try {
        print('Attempting to connect');
        _socket.connect();
        
        _socket.onConnect((_) {
          emit(SocketConnected());
          print('Connected');
        });

        _socket.onError((error) {
          emit(SocketFailure(error.toString()));
        });

        _socket.onDisconnect((_) {
          emit(SocketDisconnected());
          print('Disconnected');
        });
      } catch (e) {
        emit(SocketFailure(e.toString()));
      }
    });

    on<Disconnect>((event, emit) async {
      try {
        _socket.disconnect();
        _socket.off('connect');
        _socket.off('error');
        _socket.off('disconnect');
      } catch (e) {
        emit(SocketFailure(e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    _socket.disconnect();
    _socket.dispose();
    return super.close();
  }
}
