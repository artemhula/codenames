import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/middleware/socket_middleware.dart';
import 'package:codenames/redux/middleware/nickname_middleware.dart';
import 'package:codenames/redux/reducers.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/redux/middleware/theme_middleware.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

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
      middleware: [nicknameMiddleware, socketMiddleware, themeMiddleware],
    ),
  );

  sl<Store<AppState>>().dispatch(InitNicknameAction());
  sl<Store<AppState>>().dispatch(InitThemeAction());
}
