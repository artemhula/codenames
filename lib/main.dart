import 'package:codenames/bloc/room/room_bloc.dart';
import 'package:codenames/bloc/room_list/room_list_bloc.dart';
import 'package:codenames/bloc/socket/socket_bloc.dart';
import 'package:codenames/bloc/user/user_bloc.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/screens/main_screen.dart';
import 'package:codenames/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const CodenamesGame());
}

class CodenamesGame extends StatelessWidget {
  const CodenamesGame({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SocketBloc>(create: (context) => sl<SocketBloc>()),
        BlocProvider<UserBloc>(create: (context) => sl<UserBloc>()),
        BlocProvider<RoomListBloc>(create: (context) => sl<RoomListBloc>()),
        BlocProvider<RoomBloc>(create: (context) => sl<RoomBloc>()),
      ],
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }
}
