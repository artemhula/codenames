import 'package:codenames/features/menu/widgets/nickname_changer.dart';
import 'package:codenames/features/menu/widgets/theme_changer.dart';
import 'package:codenames/generated/l10n.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    S.of(context).settings,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 20),
                NicknameChanger(),
                const SizedBox(height: 20),
                const ThemeChanger(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
