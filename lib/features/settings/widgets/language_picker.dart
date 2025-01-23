import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/constants.dart';
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
              height: Constants.textMaxHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                borderRadius: BorderRadius.circular(Constants.borderRadius),
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white.withOpacity(0.3)
                    : Colors.black.withOpacity(0.3),
              ),
              child: DropdownButton(
                value: locale?.languageCode,
                onChanged: (String? value) {
                  sl<Store<AppState>>().dispatch(
                    ChangeLanguageAction(language: value!),
                  );
                },
                style: Theme.of(context).textTheme.bodyMedium!,
                underline: Container(),
                borderRadius: BorderRadius.circular(Constants.borderRadius),
                items: Constants.dictionaries.keys
                    .map(
                      (String key) => DropdownMenuItem(
                        value: key,
                        child: Text(
                          Constants.dictionaries[key]!,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
