import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Codenames',
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
