import 'package:codenames/features/game/widgets/team_confetti.dart';
import 'package:codenames/features/menu/screens/main_screen.dart';
import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class EndGameScreen extends StatelessWidget {
  const EndGameScreen({
    super.key,
    required this.winnerTeam,
    // required this.redCount,
    // required this.blueCount,
  });

  final String winnerTeam;
  // final int redCount;
  // final int blueCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Background(),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).gameOver,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        winnerTeam == "blue"
                            ? S.of(context).blue
                            : S.of(context).blue,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: winnerTeam == "blue"
                                    ? Colors.blue
                                    : Colors.red,
                                fontWeight: FontWeight.w900),
                      ),
                      Text(
                        S.of(context).teamWon,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       'Рахунок: ',
                  //       style: Theme.of(context).textTheme.headlineSmall,
                  //     ),
                  //     Text(
                  //       blueCount.toString(),
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .headlineSmall!
                  //           .copyWith(
                  //               color: Colors.blue,
                  //               fontWeight: FontWeight.w900),
                  //     ),
                  //     Text(
                  //       ' : ',
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .headlineSmall!
                  //           .copyWith(fontWeight: FontWeight.w900),
                  //     ),
                  //     Text(
                  //       redCount.toString(),
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .headlineSmall!
                  //           .copyWith(
                  //               color: Colors.red, fontWeight: FontWeight.w900),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      sl<Store<AppState>>().dispatch(ClearRoomStateAction());
                      Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                          (route) => false);
                    },
                    child: Text(
                      S.of(context).backToMainScreen,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            TeamConfetti(winnerTeam: winnerTeam),
          ],
        ),
      ),
    );
  }
}
