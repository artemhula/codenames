import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:codenames/features/menu/widgets/buttons_bar.dart';
import 'package:codenames/features/menu/widgets/filter.dart';
import 'package:codenames/features/menu/widgets/logo.dart';
import 'package:codenames/features/menu/widgets/room_list_tile.dart';
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
            child: StoreConnector(
              converter: (Store<AppState> store) => store.state,
              builder: (BuildContext context, state) {
                if (state.roomsListState.status == Status.success) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ButtonsBar(),
                        const SizedBox(height: 20),
                        const Hero(tag: 'logo', child: Logo()),
                        const SizedBox(height: 10),
                        const Filter(),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.separated(
                            itemCount: state.roomsListState.rooms!.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) => RoomListTile(
                                room: state.roomsListState.rooms![index]),
                          ),
                        ),
                        if (state.roomsListState.rooms!.isEmpty)
                          Center(
                            child: Text(
                              'Немає кімнат. Створіть першу!',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: Text(state.roomsListState.status.toString()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
