import 'package:flutter/material.dart';

class FridgeMateApp extends StatelessWidget {
  const FridgeMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FridgeMate',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(
        body: Center(child: Text('FridgeMate - Phase 1 Ready')),
      ),
    );
  }
}
