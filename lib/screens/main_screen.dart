import 'package:codenames/widgets/background.dart';
import 'package:codenames/widgets/buttons_bar.dart';
import 'package:codenames/widgets/filter.dart';
import 'package:codenames/widgets/logo.dart';
import 'package:codenames/widgets/room_list_tile.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ButtonsBar(),
                  SizedBox(height: 20),
                  Logo(),
                  SizedBox(height: 10),
                  Filter(),
                  SizedBox(height: 20),
                  RoomListTile(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
