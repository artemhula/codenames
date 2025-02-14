import 'package:codenames/locator.dart';
import 'package:codenames/shared/constants.dart';
import 'package:codenames/shared/models/card.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:just_audio/just_audio.dart';
import 'package:redux/redux.dart';
import 'package:vibration/vibration.dart';

class WordCard extends StatefulWidget {
  const WordCard({
    super.key,
    required this.card,
    required this.isCaptain,
    required this.team,
  });
  final CardModel card;
  final bool isCaptain;
  final String team;

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void didUpdateWidget(covariant WordCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.card.isClicked && !oldWidget.card.isClicked) {
      if (!widget.isCaptain) {
        cardKey.currentState?.toggleCard();
      }
      if (sl<Store<AppState>>().state.settingsState.soundOn) {
        final player = AudioPlayer()..setAsset('assets/audio/card.mp3');
        player.play();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: cardKey,
      flipOnTouch: false,
      side: widget.isCaptain || widget.card.isClicked ? CardSide.BACK : CardSide.FRONT,
      front: GestureDetector(
        onTap: () async {
          sl<Store<AppState>>().dispatch(ClickCardAction(widget.card, widget.team));
          if ((await Vibration.hasVibrator() ?? false) && sl<Store<AppState>>().state.settingsState.vibrationOn) {
            Vibration.vibrate(duration: 100);
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(Constants.cardPadding),
            child: Center(
              child: Text(
                widget.card.word,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ),
      back: Card(
        color: widget.card.getColor(),
        child: Padding(
          padding: const EdgeInsets.all(Constants.cardPadding),
          child: Center(
            child: widget.isCaptain && widget.card.isClicked
                ? Container()
                : Text(
                    widget.card.word,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
