import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/features/game/screens/game_screen.dart';
import 'package:codenames/features/game/widgets/action_button.dart';
import 'package:codenames/shared/widgets/background.dart';
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
                  builder: (BuildContext context, RoomState roomState) {
                    if (roomState.room?.cardset != null &&
                        roomState.room!.cardset!.isNotEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const GameScreen()),
                        );
                      });
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          S.of(context).teams,
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
                                      S.of(context).red,
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
                                      S.of(context).blue,
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
                              Text(S.of(context).noTeam),
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
                                      sl<Store<AppState>>().dispatch(
                                          const JoinTeamAction(team: 'red'));
                                    },
                                    color: Colors.red,
                                    text: S.of(context).join,
                                  ),
                                if (userState.user!.team == 'red')
                                  ActionButton(
                                    onPressed: () {
                                      sl<Store<AppState>>()
                                          .dispatch(ToggleRoleAction());
                                    },
                                    color: Colors.red,
                                    text: userState.user!.role == 'player'
                                        ? S.of(context).becomeACaptain
                                        : S.of(context).becomeAPlayer,
                                  ),
                                if (userState.user!.id ==
                                        roomState.room!.creator &&
                                    roomState.room!.users!.length >= 4)
                                  ActionButton(
                                    onPressed: () {
                                      sl<Store<AppState>>()
                                          .dispatch(StartGameAction());
                                    },
                                    color: Colors.white12,
                                    text: S.of(context).startTheGame,
                                  ),
                                if (userState.user!.team == null ||
                                    userState.user!.team == 'red')
                                  ActionButton(
                                    onPressed: () {
                                      sl<Store<AppState>>().dispatch(
                                          const JoinTeamAction(team: 'blue'));
                                    },
                                    color: Colors.blue,
                                    text: S.of(context).join,
                                  ),
                                if (userState.user!.team == 'blue')
                                  ActionButton(
                                    onPressed: () {
                                      sl<Store<AppState>>()
                                          .dispatch(ToggleRoleAction());
                                    },
                                    color: Colors.blue,
                                    text: userState.user!.role == 'player'
                                        ? S.of(context).becomeACaptain
                                        : S.of(context).becomeAPlayer,
                                  ),
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
