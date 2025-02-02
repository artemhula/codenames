import 'package:codenames/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class PasswordInput extends StatelessWidget {
  final List<int> password;
  final Function(int, int) onChanged;

  const PasswordInput({
    super.key,
    required this.onChanged,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          S.of(context).enterRoomPassword,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberPicker(
                itemWidth: 80,
                value: password[0],
                minValue: 0,
                maxValue: 9,
                selectedTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                onChanged: (value) => onChanged(0, value),
              ),
              NumberPicker(
                itemWidth: 80,
                value: password[1],
                minValue: 0,
                maxValue: 9,
                selectedTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                onChanged: (value) => onChanged(1, value),
              ),
              NumberPicker(
                itemWidth: 80,
                value: password[2],
                minValue: 0,
                maxValue: 9,
                selectedTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                onChanged: (value) => onChanged(2, value),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
