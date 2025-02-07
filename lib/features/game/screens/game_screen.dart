import 'package:codenames/features/game/screens/end_game_screen.dart';
import 'package:codenames/features/menu/screens/main_screen.dart';
import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/constants.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:codenames/features/game/widgets/counter.dart';
import 'package:codenames/features/game/widgets/players_counter.dart';
import 'package:codenames/features/game/widgets/word_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  void _showLeaveRoomPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          alignment: Alignment.center,
          height: Constants.textPopUpContentHeight,
          width: Constants.textPopUpContentWidth,
          child: Text(
            S.of(context).leaveRoomQuestion,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
                (route) => false,
              );
              sl<Store<AppState>>().dispatch(LeaveRoomAction());
            },
            child: Text(
              S.of(context).leave,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        _showLeaveRoomPopUp(context);
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              const Background(),
              Padding(
                padding: const EdgeInsets.all(Constants.padding),
                child: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  onWillChange: (previousState, newState) {
                    if (newState.roomState.winnerTeam != null && previousState?.roomState.winnerTeam == null) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EndGameScreen(
                            winnerTeam: newState.roomState.winnerTeam!,
                          ),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state.roomState.room == null) {
                      return const CupertinoActivityIndicator(
                        radius: Constants.progressIndicatorRadius,
                      );
                    }

                    final room = state.roomState.room!;
                    final user = state.userState.user!;
                    final redPlayersCount = room.getUsersByTeam('red').length;
                    final bluePlayersCount = room.getUsersByTeam('blue').length;

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              room.name,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            IconButton(
                              icon: const Icon(Icons.exit_to_app_rounded),
                              color: Theme.of(context).colorScheme.primary,
                              onPressed: () {
                                _showLeaveRoomPopUp(context);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlayersCounter(
                              redPlayersCount: redPlayersCount,
                              bluePlayersCount: bluePlayersCount,
                            ),
                            Text(
                              user.team == 'blue'
                                  ? S.of(context).youAreInTheBlueTeam
                                  : S.of(context).youAreInTheRedTeam,
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: user.team == 'blue' ? Constants.blueColor : Constants.redColor,
                                  ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: Counter(
                            redCount: room.cardset!.where((c) => c.teamName == 'red' && c.isClicked).length,
                            blueCount: room.cardset!.where((c) => c.teamName == 'blue' && c.isClicked).length,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: WordCards(
                              cards: room.cardset!,
                              user: user,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
