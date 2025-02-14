import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/features/game/screens/game_screen.dart';
import 'package:codenames/features/game/widgets/action_button.dart';
import 'package:codenames/shared/constants.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        sl<Store<AppState>>().dispatch(LeaveRoomAction());
      },
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              const Background(),
              Padding(
                padding: const EdgeInsets.all(Constants.padding),
                child: StoreConnector(
                    converter: (Store<AppState> store) => store.state.roomState,
                    builder: (BuildContext context, RoomState roomState) {
                      if (roomState.room?.cardset != null && roomState.room!.cardset!.isNotEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const GameScreen(),
                            ),
                            (route) => false,
                          );
                        });
                      }
                      if (roomState.room == null) {
                        return const CupertinoActivityIndicator(
                          radius: Constants.progressIndicatorRadius,
                        );
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
                                        style:
                                            Theme.of(context).textTheme.bodyLarge!.copyWith(color: Constants.redColor),
                                      ),
                                      Column(
                                        children: roomState.room!
                                            .getUsersByTeam('red')
                                            .map((user) => Text('${user.name} ${user.role == 'captain' ? '👑' : ''}'))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: double.maxFinite,
                                  child: VerticalDivider(
                                    color: Constants.greyColor,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        S.of(context).blue,
                                        style:
                                            Theme.of(context).textTheme.bodyLarge!.copyWith(color: Constants.blueColor),
                                      ),
                                      Column(
                                        children: roomState.room!
                                            .getUsersByTeam('blue')
                                            .map((user) => Text('${user.name} ${user.role == 'captain' ? '👑' : ''}'))
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
                                  roomState.room!.getUsersByTeam(null).map((user) => user.name).join(', '),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),
                          StoreConnector(
                            converter: (Store<AppState> store) => store.state.userState,
                            builder: (context, UserState userState) {
                              return Row(
                                children: [
                                  if (userState.user!.team == null || userState.user!.team == 'blue')
                                    ActionButton(
                                      onPressed: () {
                                        sl<Store<AppState>>().dispatch(const JoinTeamAction(team: 'red'));
                                      },
                                      color: Constants.redColor,
                                      text: S.of(context).join,
                                    ),
                                  if (userState.user!.team == 'red')
                                    ActionButton(
                                      onPressed: () {
                                        sl<Store<AppState>>().dispatch(
                                          ToggleRoleAction(
                                              futureRole: userState.user!.role == 'player' ? 'captain' : 'player'),
                                        );
                                      },
                                      color: Constants.redColor,
                                      text: userState.user!.role == 'player'
                                          ? S.of(context).becomeACaptain
                                          : S.of(context).becomeAPlayer,
                                    ),
                                  if (userState.user!.id == roomState.room!.creator &&
                                      roomState.room!.users!.length >= 4)
                                    ActionButton(
                                      onPressed: () {
                                        sl<Store<AppState>>().dispatch(StartGameAction());
                                      },
                                      color: Constants.greyColor,
                                      text: S.of(context).startTheGame,
                                    ),
                                  if (userState.user!.team == null || userState.user!.team == 'red')
                                    ActionButton(
                                      onPressed: () {
                                        sl<Store<AppState>>().dispatch(const JoinTeamAction(team: 'blue'));
                                      },
                                      color: Constants.blueColor,
                                      text: S.of(context).join,
                                    ),
                                  if (userState.user!.team == 'blue')
                                    ActionButton(
                                      onPressed: () {
                                        sl<Store<AppState>>().dispatch(
                                          ToggleRoleAction(
                                              futureRole: userState.user!.role == 'player' ? 'captain' : 'player'),
                                        );
                                      },
                                      color: Constants.blueColor,
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
      ),
    );
  }
}
