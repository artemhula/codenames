import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LanguagePicker extends StatelessWidget {
  LanguagePicker({super.key});
  final TextEditingController controller = TextEditingController()..text;

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => store.state.userState,
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).appLanguage,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          StoreConnector(
            converter: (Store<AppState> store) =>
                store.state.settingsState.locale,
            builder: (context, locale) => Container(
              alignment: Alignment.center,
              width: 130,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                value: locale?.languageCode,
                onChanged: (String? value) {
                  sl<Store<AppState>>().dispatch(
                    ChangeLanguageAction(language: value!),
                  );
                },
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                underline: Container(),
                borderRadius: BorderRadius.circular(10),
                iconDisabledColor: Theme.of(context).colorScheme.primary,
                iconEnabledColor: Theme.of(context).colorScheme.primary,
                items: const [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 'uk',
                    child: Text('Українська'),
                  ),
                  DropdownMenuItem(
                    value: 'ru',
                    child: Text('Русский'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
