import 'package:codenames/features/game/widgets/team_confetti.dart';
import 'package:codenames/features/menu/screens/main_screen.dart';
import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:redux/redux.dart';

class EndGameScreen extends StatefulWidget {
  const EndGameScreen({
    super.key,
    required this.winnerTeam,
  });

  final String winnerTeam;

  @override
  State<EndGameScreen> createState() => _EndGameScreenState();
}

class _EndGameScreenState extends State<EndGameScreen> {
  @override
  void initState() {
    super.initState();
    if (sl<Store<AppState>>().state.settingsState.soundOn) {
      final player = AudioPlayer()..setAsset('assets/audio/end_game.mp3');
      player.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                        widget.winnerTeam == "blue"
                            ? S.of(context).blue
                            : S.of(context).blue,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: widget.winnerTeam == "blue"
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
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(
                      S.of(context).backToMainScreen,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            TeamConfetti(winnerTeam: widget.winnerTeam),
          ],
        ),
      ),
    );
  }
}
