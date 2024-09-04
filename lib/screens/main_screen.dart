import 'package:codenames/bloc/room_list/room_list_bloc.dart';
import 'package:codenames/bloc/socket/socket_bloc.dart';
import 'package:codenames/widgets/background.dart';
import 'package:codenames/widgets/buttons_bar.dart';
import 'package:codenames/widgets/filter.dart';
import 'package:codenames/widgets/logo.dart';
import 'package:codenames/widgets/room_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<SocketBloc>().add(Connect());
    context.read<RoomListBloc>().add(GetRoomList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          SafeArea(
            child: BlocBuilder<RoomListBloc, RoomListState>(
              builder: (context, state) {
                if (state is RoomListLoaded) {
                  return Padding(
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
                          child: ListView.separated(
                            itemCount: state.rooms.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) =>
                                RoomListTile(room: state.rooms[index]),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is RoomListFailure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.errorMessage),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            context.read<RoomListBloc>().add(GetRoomList());
                          },
                          child: const Text('Спробувати ще раз'),
                        ),
                      ],
                    ),
                  );
                } else if (state is RoomListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
