import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final VoidCallback onSettingsPressed;

  const AppHeader({super.key, required this.onSettingsPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.settings, size: 28),
            onPressed: onSettingsPressed,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const Text(
            'Price in Life',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFFEFF6FF), // Light blue
            child: Icon(Icons.person_outline, color: Color(0xFF2563EB)),
          ),
        ],
      ),
    );
  }
}
