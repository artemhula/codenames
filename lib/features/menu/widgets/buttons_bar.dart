import 'package:codenames/features/menu/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
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
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const SettingsScreen()),
            );
          },
          child: Icon(
            Icons.settings,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
