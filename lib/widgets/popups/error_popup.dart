import 'package:codenames/bloc/room/room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
               context.read<RoomBloc>().add(ResetState());
              });
            });
          },
          child: const Text('ОК'),
        ),
      ],
    );
  }
}