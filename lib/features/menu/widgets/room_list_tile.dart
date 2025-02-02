import 'package:codenames/generated/l10n.dart';
import 'package:codenames/shared/constants.dart';
import 'package:codenames/shared/models/room.dart';
import 'package:flutter/material.dart';

class RoomListTile extends StatelessWidget {
  const RoomListTile({
    super.key,
    required this.room,
    required this.onTap,
  });
  final RoomModel room;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(Constants.borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(Icons.games_outlined, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      room.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      S.of(context).roomInfo(room.usersInRoom, Constants.dictionaries[room.language]!,
                          room.isGameStarted ? S.of(context).gameStarted : ''),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
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
