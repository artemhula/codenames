import 'package:codenames/generated/l10n.dart';
import 'package:codenames/shared/constants.dart';
import 'package:flutter/material.dart';

class RoomSummary extends StatelessWidget {
  const RoomSummary(
      {super.key,
      required this.roomName,
      required this.password,
      required this.language});
  final String roomName;
  final List<int> password;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).checkTheDataDD,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Card(
            child: Container(
          padding: const EdgeInsets.all(Constants.padding),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            children: [
              Text(S.of(context).nameN(roomName)),
              const SizedBox(height: 10),
              Text(S.of(context).passwordNNN('${password[0]}${password[1]}${password[2]}')),
              const SizedBox(height: 10),
              Text(
                  S.of(context).dictionaryN(Constants.dictionaries[language]!)),
            ],
          ),
        ))
      ],
    );
  }
}
