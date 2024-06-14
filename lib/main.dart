import 'package:codenames/screens/main_screen.dart';
import 'package:codenames/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CodenamesGame());
}

class CodenamesGame extends StatelessWidget {
  const CodenamesGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
