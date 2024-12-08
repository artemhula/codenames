import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class NicknameChanger extends StatelessWidget {
  NicknameChanger({super.key});
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
            S.of(context).nicknameDD,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
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
                      borderRadius: BorderRadius.circular(10),
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
                    foregroundColor: Theme.of(context).colorScheme.brightness ==
                            Brightness.light
                        ? Colors.white
                        : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(80 ,40),
                    padding: const EdgeInsets.all(8)),
                child: state.status == Status.loading
                    ? const CupertinoActivityIndicator()
                    : Text(
                        S.of(context).change,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.light
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
