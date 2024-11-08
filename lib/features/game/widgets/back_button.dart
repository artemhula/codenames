import 'package:flutter/material.dart';

class BackToMainButton extends StatelessWidget {
  const BackToMainButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.arrow_back_ios,
        size: 30,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
