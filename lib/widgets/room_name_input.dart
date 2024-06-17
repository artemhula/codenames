import 'package:flutter/material.dart';

class RoomNameInput extends StatelessWidget {
  const RoomNameInput({
    super.key, required this.onChanged,
  });
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Введіть назву зали:',
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            onChanged: onChanged,
            maxLength: 30,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.white.withOpacity(0.3)
                  : Colors.black.withOpacity(0.3),
              focusColor: Theme.of(context).colorScheme.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
