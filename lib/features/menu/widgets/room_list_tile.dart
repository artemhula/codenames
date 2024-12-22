import 'package:codenames/generated/l10n.dart';
import 'package:codenames/shared/models/room.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/features/game/screens/choose_role_screen.dart';
import 'package:codenames/features/menu/widgets/popups/error_popup.dart';
import 'package:codenames/features/menu/widgets/popups/loading_popup.dart';
import 'package:codenames/features/menu/widgets/popups/password_popup.dart';
import 'package:codenames/utils/lang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class RoomListTile extends StatelessWidget {
  const RoomListTile({
    super.key,
    required this.room,
  });
  final RoomModel room;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => StoreConnector(
            builder: (BuildContext context, roomState) {
              if (room.isGameStarted) {
                return const ErrorPopUp(
                  message: 'Гра вже почалася',
                );
              } else
              if (roomState.status == Status.loading) {
                return const LoadingPopUp();
              } else if (roomState.status == Status.failure) {
                return ErrorPopUp(
                  message: S.of(context).passwordIsIncorrect,
                );
              } else if (roomState.status == Status.success) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                      builder: (context) => const ChooseRoleScreen(),
                    ),
                  );
                });
              }
              return PasswordPopUp(roomId: room.id);
            },
            converter: (Store<AppState> store) => store.state.roomState,
          ),
        );
      },
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.games_outlined,
                      color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          room.name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      Text(
                        S.of(context).roomInfo(
                            room.usersInRoom,
                            dict[room.language]!,
                            room.isGameStarted
                                ? S.of(context).gameStarted
                                : ''),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.navigate_next,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
