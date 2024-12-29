import 'package:codenames/features/game/screens/end_game_screen.dart';
import 'package:codenames/features/game/widgets/back_button.dart';
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

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        sl<Store<AppState>>().dispatch(LeaveRoomAction());
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
                    if (newState.roomState.winnerTeam != null &&
                        previousState?.roomState.winnerTeam == null) {
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
                    final captainPlayersCount =
                        room.users!.where((u) => u.role == 'captain').length;

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              room.name,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            BackToMainButton(
                              onTap: () {
                                sl<Store<AppState>>()
                                    .dispatch(GetRoomsAction());
                                Navigator.of(context).pop();
                                sl<Store<AppState>>()
                                    .dispatch(ClearRoomStateAction());
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        PlayersCounter(
                          spyPlayersCount: redPlayersCount,
                          redPlayersCount: captainPlayersCount,
                          bluePlayersCount: bluePlayersCount,
                        ),
                        Expanded(
                          flex: 1,
                          child: Counter(
                            redCount: room.cardset!
                                .where(
                                    (c) => c.teamName == 'red' && c.isClicked)
                                .length,
                            blueCount: room.cardset!
                                .where(
                                    (c) => c.teamName == 'blue' && c.isClicked)
                                .length,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: WordCards(
                            cards: room.cardset!,
                            user: user,
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
