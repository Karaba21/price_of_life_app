import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../features/home/home_screen.dart';

class PriceInLifeApp extends StatelessWidget {
  const PriceInLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Price in Life',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
