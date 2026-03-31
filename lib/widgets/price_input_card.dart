import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import '../../theme/app_theme.dart';

class PriceInputCard extends StatefulWidget {
  final Function(String) onChanged;

  const PriceInputCard({super.key, required this.onChanged});

  @override
  State<PriceInputCard> createState() => _PriceInputCardState();
}

class _PriceInputCardState extends State<PriceInputCard> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  KeyboardActionsConfig _buildKeyboardConfig() {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.transparent,
      nextFocus: false,
      actions: [
        KeyboardActionsItem(
          focusNode: _focusNode,
          displayArrows: false,
          toolbarButtons: [
            (node) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => node.unfocus(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.cardWhite,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.keyboard_hide_outlined,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      config: _buildKeyboardConfig(),
      disableScroll: true,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: AppTheme.cardWhite,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
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
              focusNode: _focusNode,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
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
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
