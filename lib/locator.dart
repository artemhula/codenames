import 'package:codenames/redux/middleware.dart';
import 'package:codenames/redux/reducers.dart';
import 'package:codenames/redux/state.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton(
    () => IO.io(
      'http://localhost:3000',
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      },
    ),
  );

  sl.registerLazySingleton(
    () => Store<AppState>(
      appReducer,
      initialState: const AppState.initial(),
      middleware: [socketMiddleware],
    ),
  );
}
