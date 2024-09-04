import 'package:codenames/bloc/room/room_bloc.dart';
import 'package:codenames/bloc/room_list/room_list_bloc.dart';
import 'package:codenames/bloc/socket/socket_bloc.dart';
import 'package:codenames/bloc/user/user_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<IO.Socket>(
    IO.io(
      'http://localhost:3000',
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      },
    ),
  );

  sl.registerFactory<SocketBloc>(() => SocketBloc(sl<IO.Socket>()));
  sl.registerFactory<UserBloc>(() => UserBloc(sl<IO.Socket>()));
  sl.registerFactory<RoomListBloc>(() => RoomListBloc(sl<IO.Socket>()));
  sl.registerFactory<RoomBloc>(() => RoomBloc(sl<IO.Socket>()));
}