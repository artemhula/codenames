import 'dart:math';

import 'package:codenames/widgets/word_card.dart';
import 'package:flutter/material.dart';

class WordCards extends StatelessWidget {
  const WordCards({
    super.key,
    required this.cards,
  });
  final List cards;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 25,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return WordCard(
          word: 'Слово $index',
          color: Random().nextBool() ? Colors.red : Colors.blue,
        );
      },
    );
  }
}
