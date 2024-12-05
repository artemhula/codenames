import 'package:codenames/generated/l10n.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.redCount,
    required this.blueCount,
  });
  final int redCount;
  final int blueCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).score),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  redCount.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.red),
                ),
              ],
            ),
            Text(
              blueCount.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }
}
