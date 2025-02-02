import 'package:codenames/app.dart';
import 'package:codenames/locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const CodenamesGame());
}
