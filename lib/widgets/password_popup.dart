import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/widgets/password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
    return StoreConnector(
      converter: (Store<AppState> store) => store.state.roomState,
      builder: (BuildContext context, RoomState roomState) {
        if (roomState.status == Status.loading) {
          return const AlertDialog(
            content: SizedBox(
              height: 250,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (roomState.status == Status.failure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                content: Text(roomState.message ?? 'Невідома помилка')));
            sl<Store<AppState>>().dispatch(const UpdateRoomState(status: Status.initial));
          });
        } else if (roomState.status == Status.success) {
          print(roomState.room);
        }

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
                sl<Store<AppState>>().dispatch(JoinRoom(
                    roomId: widget.roomId,
                    password: int.parse(password.take(3).join())));
              },
              child: const Text('Увійти'),
            ),
          ],
        );
      },
    );
  }
}
