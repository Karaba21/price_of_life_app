import 'package:flutter/material.dart';

class FooterItem extends StatelessWidget {
  final String text;
  final IconData icon;

  const FooterItem({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
