import 'package:codenames/shared/models/card.dart';
import 'package:codenames/shared/models/user.dart';
import 'package:codenames/features/game/widgets/word_card.dart';
import 'package:flutter/material.dart';

class WordCards extends StatelessWidget {
  const WordCards({
    super.key,
    required this.cards,
    required this.user,
  });
  final List<CardModel> cards;
  final UserModel user;

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
          card: cards[index],
          isCaptain: user.role == 'captain',
          team: user.team!,
        );
      },
    );
  }
}
