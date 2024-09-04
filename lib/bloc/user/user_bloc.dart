import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:codenames/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IO.Socket _socket;

  UserBloc(this._socket) : super(UserInitial()) {
    on<CreateUser>((event, emit) async {
      _socket.emitWithAck(
        'new-user',
        [
          String.fromCharCodes(
              List.generate(7, (index) => Random().nextInt(33) + 89))
        ],
        ack: (data) {},
      );

      _socket.on(
        'get-user-info',
        (data) async {
          if (data is Map<String, dynamic>) {
            try {
              emit(UserLoaded(UserModel.fromJson(data)));
            } catch (e) {
              emit(UserFailure('Error'));
            }
          }
        },
      );
    });
  }
}