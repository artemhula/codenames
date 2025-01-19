import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/middleware/shared_preferences_middleware.dart';
import 'package:codenames/redux/middleware/socket_middleware.dart';
import 'package:codenames/redux/reducers.dart';
import 'package:codenames/redux/state.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  await dotenv.load(fileName: '.env');

  sl.registerLazySingleton(
    () => IO.io(
      dotenv.env['SOCKET_URL'],
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
      middleware: [sharedPreferencesMiddleware, socketMiddleware],
    ),
  );

  sl<Store<AppState>>().dispatch(InitNicknameAction());
  sl<Store<AppState>>().dispatch(InitSettingsAction());
}
