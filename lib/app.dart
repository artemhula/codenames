import 'package:codenames/features/menu/screens/main_screen.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/theme.dart';
import 'package:codenames/shared/widgets/snack_bar_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CodenamesGame extends StatelessWidget {
  const CodenamesGame({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: sl<Store<AppState>>(),
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              const MainScreen(),
              SnackBarListener(),
            ],
          ),
        ),
      ),
    );
  }
}
