import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:codenames/features/game/widgets/counter.dart';
import 'package:codenames/features/game/widgets/players_counter.dart';
import 'package:codenames/features/game/widgets/word_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Background(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: StoreBuilder<AppState>(
                builder: (BuildContext context, Store<AppState> store) {
                  final cards = store.state.roomState.room!.cardset;
                  final user = store.state.userState.user;
                  final redPlayersCount =
                      store.state.roomState.room!.getUsersByTeam('red').length;
                  final bluePlayersCount =
                      store.state.roomState.room!.getUsersByTeam('blue').length;
                  final captainPlayersCount = store.state.roomState.room!.users!
                      .where((u) => u.role == 'captain')
                      .length;
                  final blueCount = store.state.roomState.room!.cardset!
                      .where((c) => c.teamName == 'blue' && c.isClicked)
                      .length;
                  final redCount = store.state.roomState.room!.cardset!
                      .where((c) => c.teamName == 'red' && c.isClicked)
                      .length;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Гра 1',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const BackButton()
                        ],
                      ),
                      const SizedBox(height: 10),
                      PlayersCounter(
                        spyPlayersCount: redPlayersCount,
                        redPlayersCount: captainPlayersCount,
                        bluePlayersCount: bluePlayersCount,
                      ),
                      Expanded(
                        flex: 1,
                        child:
                            Counter(redCount: redCount, blueCount: blueCount),
                      ),
                      Expanded(
                        flex: 3,
                        child: WordCards(
                          cards: cards!,
                          user: user!,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class BackButton extends StatelessWidget {
//   const BackButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Icon(
//         Icons.arrow_back_ios,
//         size: 30,
//         color: Theme.of(context).colorScheme.primary,
//       ),
//     );
//   }
// }