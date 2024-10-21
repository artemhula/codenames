import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key, required this.onPressed, required this.color, required this.text,
  });
  final VoidCallback onPressed;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: 70,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(color),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
          child: Text(text, style: Theme.of(context).textTheme.bodySmall,),
        ),
      ),
    );
  }
}
