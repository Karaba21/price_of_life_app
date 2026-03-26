import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PriceInputCard extends StatefulWidget {
  final Function(String) onChanged;

  const PriceInputCard({super.key, required this.onChanged});

  @override
  State<PriceInputCard> createState() => _PriceInputCardState();
}

class _PriceInputCardState extends State<PriceInputCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppTheme.cardWhite,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'WHAT ARE YOU BUYING?',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
              color: AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: widget.onChanged,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
              height: 1.2,
            ),
            decoration: const InputDecoration(
              hintText: '\$ Price',
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintStyle: TextStyle(color: Color(0xFFD1D5DB)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
