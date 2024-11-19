import 'package:codenames/features/menu/widgets/logo.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:flutter/material.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  String nickname = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Logo()),
                const SizedBox(height: 12),
                Text(
                  'Привіт!👋',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 25),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      nickname = text;
                    });
                  },
                  maxLength: 20,
                  decoration: InputDecoration(
                    label: Text('Введіть нікнейм',
                        style: Theme.of(context).textTheme.bodySmall),
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
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      'Далі',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.brightness ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
