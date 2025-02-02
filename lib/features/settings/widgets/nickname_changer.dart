import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class NicknameChanger extends StatefulWidget {
  const NicknameChanger({super.key});

  @override
  State<NicknameChanger> createState() => _NicknameChangerState();
}

class _NicknameChangerState extends State<NicknameChanger> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => store.state.userState,
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).nicknameDD,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              IntrinsicWidth(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 100,
                    maxWidth: Constants.textMaxWidth,
                    minHeight: Constants.textMaxHeight,
                    maxHeight: Constants.textMaxHeight,
                  ),
                  child: TextFormField(
                    controller: controller..text = state.user!.name,
                    readOnly: state.status == Status.loading,
                    maxLength: 20,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      counterText: "",
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.light
                          ? Colors.white.withOpacity(0.3)
                          : Colors.black.withOpacity(0.3),
                      focusColor: Theme.of(context).colorScheme.primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Constants.borderRadius),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (controller.text != state.user!.name && controller.text.isNotEmpty) {
                    sl<Store<AppState>>().dispatch(
                      ChangeNicknameAction(nickname: controller.text),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor:
                        Theme.of(context).colorScheme.brightness == Brightness.light ? Colors.white : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Constants.borderRadius),
                    ),
                    fixedSize: const Size(90, Constants.textMaxHeight),
                    padding: const EdgeInsets.all(Constants.borderRadius)),
                child: state.status == Status.loading
                    ? const CupertinoActivityIndicator()
                    : Text(
                        S.of(context).change,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.black,
                            ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
