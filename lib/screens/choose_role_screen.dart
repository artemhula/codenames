import 'package:codenames/bloc/room/room_bloc.dart';
import 'package:codenames/bloc/user/user_bloc.dart';
import 'package:codenames/widgets/action_button.dart';
import 'package:codenames/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Background(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<RoomBloc, RoomState>(
                builder: (context, roomState) {
                  if (roomState is RoomLoaded) {
                    final room = roomState.room;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Команди',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Червона',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: Colors.red),
                                    ),
                                    Column(
                                      children: room
                                          .getUsersByTeam('red')
                                          .map((user) => Text(
                                              '${user.name} ${user.role == 'captain' ? '👑' : ''}'))
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: double.maxFinite,
                                child: VerticalDivider(
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Синя',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: Colors.blue),
                                    ),
                                    Column(
                                      children: room
                                          .getUsersByTeam('blue')
                                          .map((user) => Text(
                                              '${user.name} ${user.role == 'captain' ? '👑' : ''}'))
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              const Text('Без команди'),
                              Text(
                                room
                                    .getUsersByTeam(null)
                                    .map((user) => user.name)
                                    .join(', '),
                                textAlign: TextAlign.center,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<UserBloc, UserState>(
                          builder: (context, userState) {
                            if (userState is UserLoaded) {
                              final user = userState.user;
                              return Row(
                                children: [
                                  if (user.team == null || user.team == 'blue')
                                    ActionButton(
                                      onPressed: () {
                                        context
                                            .read<RoomBloc>()
                                            .add(const JoinTeam('red'));
                                      },
                                      color: Colors.red,
                                      text: 'Приєднатися',
                                    ),
                                  if (user.team == 'red')
                                    ActionButton(
                                      onPressed: () {
                                        context.read<RoomBloc>().add(
                                              ToggleRole(
                                                user.role == 'player'
                                                    ? 'captain'
                                                    : 'player',
                                              ),
                                            );
                                      },
                                      color: Colors.red,
                                      text: user.role == 'player'
                                          ? 'Стати капітаном'
                                          : 'Стати гравцем',
                                    ),
                                  if (user.team != null)
                                    ActionButton(
                                      onPressed: () {
                                        // Add event or logic for "Ready" state
                                      },
                                      color: Colors.white12,
                                      text: 'Готовий',
                                    ),
                                  if (user.team == null || user.team == 'red')
                                    ActionButton(
                                      onPressed: () {
                                        context.read<RoomBloc>().add(
                                              const JoinTeam('blue'),
                                            );
                                      },
                                      color: Colors.blue,
                                      text: 'Приєднатися',
                                    ),
                                  if (user.team == 'blue')
                                    ActionButton(
                                      onPressed: () {
                                        context.read<RoomBloc>().add(
                                              ToggleRole(
                                                user.role == 'player'
                                                    ? 'captain'
                                                    : 'player',
                                              ),
                                            );
                                      },
                                      color: Colors.blue,
                                      text: user.role == 'player'
                                          ? 'Стати капітаном'
                                          : 'Стати гравцем',
                                    ),
                                ],
                              );
                            }
                            return Container();
                          },
                        ),
                      ],
                    );
                  } else if (roomState is RoomLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (roomState is RoomError) {
                    return Center(child: Text(roomState.message));
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
