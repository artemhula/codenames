import 'package:codenames/features/create_room/screens/create_room_screen.dart';
import 'package:flutter/material.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateRoomScreen()),
            );
          },
          child: Icon(
            Icons.settings,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
