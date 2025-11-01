import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'router/app_router.dart';

class FridgeMateApp extends StatelessWidget {
  const FridgeMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FridgeMate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
