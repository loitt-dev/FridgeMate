import 'package:flutter/material.dart';

class MedicineBoxManagerApp extends StatelessWidget {
  const MedicineBoxManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine Box Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(
        body: Center(child: Text('Medicine Box Manager - Coming Soon')),
      ),
    );
  }
}
