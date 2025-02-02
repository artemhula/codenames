import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/features/create_room/widgets/password_input.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class PasswordPopUp extends StatefulWidget {
  const PasswordPopUp({super.key, required this.roomId});
  final String roomId;

  @override
  State<PasswordPopUp> createState() => _PasswordPopUpState();
}

class _PasswordPopUpState extends State<PasswordPopUp> {
  List<int> password = [5, 5, 5];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 240,
        child: PasswordInput(
          password: password,
          onChanged: (index, value) {
            setState(
              () {
                password[index] = value;
              },
            );
          },
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        InkWell(
          onTap: () {
            sl<Store<AppState>>().dispatch(
              JoinRoomAction(
                roomId: widget.roomId,
                password: int.parse(password.take(3).join()),
              ),
            );
          },
          child: Text(S.of(context).enter),
        ),
      ],
    );
  }
}
