import 'package:codenames/widgets/background.dart';
import 'package:codenames/widgets/counter.dart';
import 'package:codenames/widgets/players_counter.dart';
import 'package:codenames/widgets/word_cards.dart';
import 'package:flutter/material.dart';

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
              child: Column(
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
                  const PlayersCounter(
                    spyPlayersCount: 1,
                    redPlayersCount: 0,
                    bluePlayersCount: 2,
                  ),
                  const Expanded(
                    flex: 1,
                    child: Counter(redCount: 7, blueCount: 3),
                  ),
                  const Expanded(
                    flex: 3,
                    child: WordCards(cards: []),
                  )
                ],
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
