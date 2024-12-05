import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ThemeChanger extends StatelessWidget {
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (Store<AppState> store) =>
          store.state.themeState.themeMode == ThemeMode.dark,
      builder: (context, isDarkTheme) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Темна тема',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Switch(
              value: isDarkTheme,
              onChanged: (value) {
                sl<Store<AppState>>()
                    .dispatch(ChangeThemeAction(isDark: value));
              },
            ),
          ],
        );
      },
    );
  }
}
