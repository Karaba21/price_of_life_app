import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/calculator.dart';

class ResultCard extends StatelessWidget {
  final TimeResult? result;

  const ResultCard({super.key, this.result});

  String _getSecondaryText(TimeResult res) {
    if (res.unit == 'MONTHS') {
      final weeks = res.totalHours / (CalculatorUtils.hoursPerDay * CalculatorUtils.workDaysPerWeek);
      return '≈ ${weeks.toStringAsFixed(1)} weeks of deep work';
    } else if (res.unit == 'WEEKS') {
      final days = res.totalHours / CalculatorUtils.hoursPerDay;
      return '≈ ${days.toStringAsFixed(1)} days of deep work';
    }
    return '≈ ${res.totalHours.toStringAsFixed(1)} hours of deep work';
  }

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        decoration: BoxDecoration(
          color: AppTheme.primaryBlue,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryBlue.withValues(alpha: 0.3),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: const Column(
          children: [
            Icon(Icons.access_time, color: Colors.white54, size: 48),
            SizedBox(height: 16),
            Text(
              'Enter a price above\nto compute the cost in life',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withValues(alpha: 0.3),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'THIS COSTS YOU',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${result!.value}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                result!.unit,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'of your life',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              _getSecondaryText(result!),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
