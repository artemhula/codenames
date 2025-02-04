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
    return LayoutBuilder(
      builder: (context, constraints) {
        final cellWidth = constraints.maxWidth / 5;
        final cellHeight = constraints.maxHeight / 5;

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 25,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            childAspectRatio: cellWidth / cellHeight,
          ),
          itemBuilder: (context, index) {
            return WordCard(
              card: cards[index],
              isCaptain: user.role == 'captain',
              team: user.team!,
            );
          },
        );
      },
    );
  }
}
