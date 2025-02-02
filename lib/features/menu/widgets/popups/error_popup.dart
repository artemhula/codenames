import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class ErrorPopUp extends StatelessWidget {
  const ErrorPopUp({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 70,
        width: 200,
        alignment: Alignment.center,
        child: Text(message),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(const Duration(milliseconds: 300), () {
                sl<Store<AppState>>().dispatch(const UpdateRoomState(status: Status.initial));
              });
            });
          },
          child: const Text('ОК'),
        ),
      ],
    );
  }
}
