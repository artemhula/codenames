import 'package:codenames/screens/game_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomListTile extends StatelessWidget {
  const RoomListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
    
     GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const GameScreen(),
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
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.games_outlined,
                      color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 20),
                  Text(
                    'Гра 1',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              Icon(Icons.navigate_next,
                  color: Theme.of(context).colorScheme.primary)
            ],
          ),
        ),
      ),
    );
  }
}
