import 'package:flutter/material.dart';

class CtaButton extends StatelessWidget {
  final String text;
  final String? subtitle;
  final VoidCallback onPressed;
  final TextStyle? style;

  const CtaButton({
    super.key,
    required this.text,
    this.subtitle,
    required this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
        ],
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(onPressed: onPressed, child: Text(text, style: style)),
        ),
      ],
    );
  }
}
