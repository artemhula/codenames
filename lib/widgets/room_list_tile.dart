import 'package:codenames/bloc/room/room_bloc.dart';
import 'package:codenames/models/room.dart';
import 'package:codenames/screens/choose_role_screen.dart';
import 'package:codenames/widgets/popups/error_popup.dart';
import 'package:codenames/widgets/popups/loading_popup.dart';
import 'package:codenames/widgets/popups/password_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (context) => BlocConsumer<RoomBloc, RoomState>(
            listener: (context, roomState) {
              if (roomState is RoomLoaded) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                      builder: (context) => const ChooseRoleScreen(),
                    ),
                  );
                });
              }
            },
            builder: (BuildContext context, RoomState roomState) {
              if (roomState is RoomLoading) {
                return const LoadingPopUp();
              } else if (roomState is RoomError) {
                return ErrorPopUp(
                  message: roomState.message,
                );
              } else if (roomState is RoomInitial) {
                return PasswordPopUp(roomId: room.id);
              } else {
                return Container();
              }
            },
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
                        'Гравців: ${room.usersInRoom}',
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
