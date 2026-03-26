import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/preferences_service.dart';
import '../../theme/app_theme.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late TextEditingController _salaryController;

  @override
  void initState() {
    super.initState();
    final initialSalary = ref.read(salaryProvider);
    _salaryController = TextEditingController(
      text: initialSalary.toStringAsFixed(0),
    );
  }

  @override
  void dispose() {
    _salaryController.dispose();
    super.dispose();
  }

  void _saveSalary() {
    final value = double.tryParse(_salaryController.text);
    if (value != null && value > 0) {
      ref.read(salaryProvider.notifier).updateSalary(value);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid salary amount')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Income',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Used to calculate the value of your time.',
              style: TextStyle(color: AppTheme.textMuted),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.cardWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MONTHLY SALARY',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: AppTheme.textMuted,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _salaryController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                    decoration: const InputDecoration(
                      prefixText: '\$ ',
                      prefixStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _saveSalary,
                child: const Text('Save Changes'),
              ),
            ),
            const SizedBox(height: 64),
            const Divider(),
            const SizedBox(height: 32),
            const Text(
              'Methodology',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 16),
            const _InfoRow(
              icon: Icons.calendar_today,
              text:
                  'Monthly salary is converted into daily and hourly work value.',
            ),
            const SizedBox(height: 12),
            const _InfoRow(
              icon: Icons.access_time,
              text: 'Based on 22 workdays and 8 hours per day.',
            ),
            const SizedBox(height: 12),
            const _InfoRow(
              icon: Icons.lightbulb_outline,
              text:
                  'Estimates are illustrative and meant to help reflect on spending.',
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppTheme.primaryBlue),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textMuted,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
