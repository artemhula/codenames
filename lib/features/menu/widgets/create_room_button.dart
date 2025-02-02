import 'package:codenames/features/create_room/screens/create_room_screen.dart';
import 'package:codenames/generated/l10n.dart';
import 'package:flutter/material.dart';

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateRoomScreen()),
        );
      },
      child: Row(
        children: [
          Icon(
            Icons.add_rounded,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 5),
          Text(
            S.of(context).createARoom,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
