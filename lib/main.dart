import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'di/injection_container.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup DI BEFORE running app
  await configureDependencies();

  runApp(const ProviderScope(child: FridgeMateApp()));
}
