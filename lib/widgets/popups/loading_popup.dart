import 'package:flutter/material.dart';

class LoadingPopUp extends StatelessWidget {
  const LoadingPopUp({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 70,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
