
import 'package:codenames/models/room.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/widgets/background.dart';
import 'package:codenames/widgets/buttons_bar.dart';
import 'package:codenames/widgets/filter.dart';
import 'package:codenames/widgets/logo.dart';
import 'package:codenames/widgets/room_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ButtonsBar(),
                  const SizedBox(height: 20),
                  const Logo(),
                  const SizedBox(height: 10),
                  const Filter(),
                  const SizedBox(height: 20),
                  Expanded(
                    child: StoreConnector<AppState, List<RoomModel>>(
                      converter: (Store<AppState> store) => store.state.roomsListState.rooms,
                      builder: (context, List<RoomModel> rooms) {
                        print(rooms);
                        return ListView.separated(
                          itemCount: rooms.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 10),
                          itemBuilder: (context, index) => RoomListTile(room: rooms[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
