import 'package:flutter/material.dart';

class PlayersCounter extends StatelessWidget {
  const PlayersCounter({
    super.key,
    required this.spyPlayersCount,
    required this.redPlayersCount,
    required this.bluePlayersCount,
  });
  final int spyPlayersCount;
  final int redPlayersCount;
  final int bluePlayersCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Гравці:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 15),
        Badge(
          label: Text(redPlayersCount.toString()),
          offset: const Offset(7, -7),
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            Icons.person_outline,
            color: Colors.red.withOpacity(0.5),
          ),
        ),
        const SizedBox(width: 15),
        Badge(
          label: Text(spyPlayersCount.toString()),
          offset: const Offset(7, -7),
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(
            Icons.person_search_outlined,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 15),
        Badge(
          label: Text(bluePlayersCount.toString()),
          offset: const Offset(7, -7),
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            Icons.person_outline,
            color: Colors.blue.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
