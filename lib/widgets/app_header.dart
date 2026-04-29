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
          const SizedBox(width: 48),

          Flexible(
            child: Text(
              'How much is your life worth?',
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings, size: 28),
            onPressed: onSettingsPressed,
            color: Theme.of(context).colorScheme.onSurface,
          ), // Placeholder for spacing
        ],
      ),
    );
  }
}
