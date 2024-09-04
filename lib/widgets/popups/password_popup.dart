import 'package:codenames/bloc/room/room_bloc.dart';
import 'package:codenames/bloc/user/user_bloc.dart';
import 'package:codenames/widgets/password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        height: 250,
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
            try {
              if (context.read<UserBloc>().state is UserLoaded) {
                final userId =
                    (context.read<UserBloc>().state as UserLoaded).user.id;
                context.read<RoomBloc>().add(
                      JoinRoom(
                        widget.roomId,
                        userId,
                        password[0] * 100 + password[1] * 10 + password[2],
                      ),
                    );
              }
            } catch (e) {
              print(e);
            }
          },
          child: const Text('Увійти'),
        ),
      ],
    );
  }
}
