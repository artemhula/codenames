import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/widgets/action_button.dart';
import 'package:codenames/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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
              child: StoreConnector(
                converter: (Store<AppState> store) => store.state.roomState,
                builder: (BuildContext context, RoomState roomState) => Column(
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
                                  children: roomState.room!
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
                                  children: roomState.room!
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
                            roomState.room!
                                .getUsersByTeam(null)
                                .map((user) => user.name)
                                .join(', '),
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    StoreConnector(
                      converter: (Store<AppState> store) =>
                          store.state.userState,
                      builder: (context, UserState userState) {
                        return Row(
                          children: [
                            if (userState.user!.team == null ||
                                userState.user!.team == 'blue')
                              ActionButton(
                                onPressed: () {
                                  sl<Store<AppState>>()
                                      .dispatch(const JoinTeam(team: 'red'));
                                },
                                color: Colors.red,
                                text: 'Приєднатися',
                              ),
                            if (userState.user!.team == 'red')
                              ActionButton(
                                onPressed: () {
                                  sl<Store<AppState>>().dispatch(ToggleRole(
                                      userState.user!.role == 'player'
                                          ? 'captain'
                                          : 'player'));
                                },
                                color: Colors.red,
                                text: userState.user!.role == 'player'
                                    ? 'Стати капітаном'
                                    : 'Стати гравцем',
                              ),
                            if (userState.user!.team != null)
                              ActionButton(
                                onPressed: () {},
                                color: Colors.white12,
                                text: 'Готовий',
                              ),
                            if (userState.user!.team == null ||
                                userState.user!.team == 'red')
                              ActionButton(
                                onPressed: () {
                                  sl<Store<AppState>>()
                                      .dispatch(const JoinTeam(team: 'blue'));
                                },
                                color: Colors.blue,
                                text: 'Приєднатися',
                              ),
                            if (userState.user!.team == 'blue')
                              ActionButton(
                                onPressed: () {
                                  sl<Store<AppState>>().dispatch(ToggleRole(
                                      userState.user!.role == 'player'
                                          ? 'captain'
                                          : 'player'));
                                },
                                color: Colors.blue,
                                text: userState.user!.role == 'player'
                                    ? 'Стати капітаном'
                                    : 'Стати гравцем',
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
