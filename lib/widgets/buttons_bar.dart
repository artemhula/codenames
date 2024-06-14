import 'package:flutter/material.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.settings,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
