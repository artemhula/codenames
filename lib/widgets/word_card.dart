import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class WordCard extends StatefulWidget {
  const WordCard({super.key, required this.word, required this.color});
  final String word;
  final Color color;

  @override
  _WordCardState createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  bool isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      flipOnTouch: !isFlipped,
      onFlipDone: (status) {
        if (!isFlipped) {
          setState(() {
            isFlipped = true;
          });
        }
      },
      front: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              widget.word,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ),
      back: Card(
        color: widget.color,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              widget.word,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}
