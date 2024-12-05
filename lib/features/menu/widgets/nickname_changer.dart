import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class NicknameChanger extends StatefulWidget {
  const NicknameChanger({super.key});

  @override
  State<NicknameChanger> createState() => _NicknameChangerState();
}

class _NicknameChangerState extends State<NicknameChanger> {
  bool isLoading = false;
  late String oldNickname;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    oldNickname = sl<Store<AppState>>().state.userState.user!.name;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
                controller: controller..text = oldNickname,
                readOnly: isLoading,
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
                if (controller.text != oldNickname && controller.text.isNotEmpty) {
                  sl<Store<AppState>>().dispatch(
                    ChangeNicknameAction(nickname: controller.text),
                  );
                  setState(() {
                    isLoading = true;
                  });
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
                  fixedSize: const Size.fromHeight(40),
                  padding: const EdgeInsets.all(8)),
              child: isLoading
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
    );
  }
}
